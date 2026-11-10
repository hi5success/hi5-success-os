#!/usr/bin/env bash
# Validates the Hi5 Success OS plugins. Run from the repo root.
set -u
ERRORS=()

# 1. Every skill: SKILL.md exists, name matches the folder, description is present
#    and valid plain YAML (no ": " inside the description line).
for skill_dir in plugins/*/skills/*/; do
  skill_name=$(basename "$skill_dir")
  skill_file="${skill_dir}SKILL.md"
  if [ ! -f "$skill_file" ]; then ERRORS+=("$skill_name: missing SKILL.md"); continue; fi
  fm=$(awk '/^---/{if(found){exit}else{found=1;next}} found{print}' "$skill_file")
  name_val=$(echo "$fm" | grep -E '^name:' | sed 's/^name:[[:space:]]*//' | tr -d '[:space:]')
  [ -z "$name_val" ] && ERRORS+=("$skill_name: missing name in frontmatter")
  [ -n "$name_val" ] && [ "$name_val" != "$skill_name" ] && ERRORS+=("$skill_name: name '$name_val' does not match its folder")
  desc_line=$(echo "$fm" | grep -E '^description:')
  if [ -z "$desc_line" ]; then
    ERRORS+=("$skill_name: missing description in frontmatter")
  else
    desc_val=$(echo "$desc_line" | sed 's/^description:[[:space:]]*//')
    if [ -z "$(echo "$desc_val" | tr -d '[:space:]')" ]; then
      desc_body=$(echo "$fm" | awk '/^description:/{found=1;next} found && /^  /{print;exit} found && !/^  /{exit}')
      [ -z "$(echo "$desc_body" | tr -d '[:space:]')" ] && ERRORS+=("$skill_name: description is empty")
    elif echo "$desc_val" | grep -q ': '; then
      ERRORS+=("$skill_name: description contains ': ' which breaks YAML. Use a comma or a new sentence")
    fi
  fi
  # Skills that mention industries/ must have both industry files
  if grep -q 'industries/' "$skill_file"; then
    for f in real-estate generic; do
      [ -f "${skill_dir}industries/${f}.md" ] || ERRORS+=("$skill_name: SKILL.md uses industries/ but industries/${f}.md is missing")
    done
  fi
done

# 2. Marketplace files identical, and plugin.json matches the marketplace entry
if ! diff -q marketplace.json .claude-plugin/marketplace.json >/dev/null; then
  ERRORS+=("marketplace.json and .claude-plugin/marketplace.json differ")
fi
if command -v node >/dev/null 2>&1; then
  node_out=$(node -e '
    const fs=require("fs");
    const m=JSON.parse(fs.readFileSync("marketplace.json","utf8"));
    for(const p of m.plugins){
      const j=JSON.parse(fs.readFileSync(p.source+"/.claude-plugin/plugin.json","utf8"));
      if(j.version!==p.version) console.log(p.name+": plugin.json version "+j.version+" does not match marketplace version "+p.version);
      if(j.description!==p.description) console.log(p.name+": plugin.json description differs from the marketplace entry");
    }' 2>&1)
  [ -n "$node_out" ] && while IFS= read -r l; do ERRORS+=("$l"); done <<< "$node_out"
fi

# 3. No em dashes anywhere in the plugins, manifests, or README
if grep -rIl $'\xe2\x80\x94' plugins marketplace.json .claude-plugin README.md >/dev/null 2>&1; then
  for f in $(grep -rIl $'\xe2\x80\x94' plugins marketplace.json .claude-plugin README.md); do
    ERRORS+=("$f: contains an em dash. Use a colon, comma, or new sentence")
  done
fi

# 4. Every skill points members to /hi5-next
for skill_dir in plugins/*/skills/*/; do
  skill_name=$(basename "$skill_dir")
    grep -q '/hi5-next' "${skill_dir}SKILL.md" 2>/dev/null || ERRORS+=("$skill_name: SKILL.md never mentions /hi5-next. Every skill ends with a Next line")
done

# 5. path.md is the single source of truth for what /hi5-next recommends.
#    Every skill folder needs a row, and the status must match reality:
#    live = shipped (not a stub), coming = not built or still a stub.
PATH_MD="plugins/business-os/skills/hi5-next/references/path.md"
if [ ! -f "$PATH_MD" ]; then
  ERRORS+=("$PATH_MD is missing")
else
  rows=$(grep -E '^\| `/hi5-' "$PATH_MD")
  # every skill folder has a row
  for skill_dir in plugins/*/skills/*/; do
    skill_name=$(basename "$skill_dir")
        echo "$rows" | awk -F'|' '{gsub(/[ `\/]/,"",$2); print $2}' | grep -qx "$skill_name" || ERRORS+=("path.md has no row for $skill_name. Add it, with a status of live or coming")
  done
  # every row has a valid status that matches the folder
  while IFS= read -r row; do
    [ -z "$row" ] && continue
    name=$(echo "$row" | awk -F'|' '{gsub(/[ `\/]/,"",$2); print $2}')
    status=$(echo "$row" | awk -F'|' '{gsub(/[ ]/,"",$4); print $4}')
    dir=$(ls -d plugins/*/skills/"$name"/ 2>/dev/null | head -1)
    case "$status" in
      live)
        if [ -z "$dir" ]; then ERRORS+=("path.md lists $name as live but no skill folder exists")
        elif grep -q 'STUB' "${dir}SKILL.md"; then ERRORS+=("path.md lists $name as live but its SKILL.md is still a stub")
        fi;;
      coming)
        if [ -n "$dir" ] && ! grep -q 'STUB' "${dir}SKILL.md"; then ERRORS+=("path.md lists $name as coming but it has shipped. Change it to live")
        fi;;
      *) ERRORS+=("path.md row for $name has status '$status'. Use live or coming");;
    esac
    # live skills must be in the README (the skills live in the Hi5 Vault, so there is no Skill Guide list here)
    if [ "$status" = "live" ]; then
      grep -q "/$name" README.md || ERRORS+=("README.md does not list /$name")
    fi
  done <<< "$rows"
fi

# 6. Every skill that saves to the Marketing Hub carries the safety net, so a missing
#    Marketing Hub never makes a save fail
for skill_dir in plugins/marketing-os/skills/*/ plugins/real-estate-os/skills/*/; do
  skill_name=$(basename "$skill_dir")
  if grep -q 'marketing_hub_db_id' "${skill_dir}SKILL.md"; then
    grep -q 'Marketing Hub safety net' "${skill_dir}SKILL.md" || ERRORS+=("$skill_name: saves to the Marketing Hub but has no 'Marketing Hub safety net' section")
  fi
done

# 7. Marketing Hub Type list: the setup layout and every safety net must list the same options
WB="plugins/business-os/skills/hi5-setup/templates/workspace-build.md"
wb_types=$(grep -E '^\| Type \| select \|' "$WB" | head -1 | sed 's/^| Type | select | //; s/ |[[:space:]]*$//')
for skill_dir in plugins/marketing-os/skills/*/ plugins/real-estate-os/skills/*/; do
  skill_name=$(basename "$skill_dir")
  if grep -q 'Marketing Hub safety net' "${skill_dir}SKILL.md"; then
    grep -qF "Type (select: $wb_types)" "${skill_dir}SKILL.md" || ERRORS+=("$skill_name: the Marketing Hub safety net Type list does not match workspace-build.md ($wb_types)")
  fi
done

# 8. No original source author or trademarked method names anywhere in the plugins
if grep -rIniE 'hormozi|schwartz|storybrand|brunson|epiphany bridge|grand slam|value equation' plugins >/dev/null 2>&1; then
  for f in $(grep -rIliE 'hormozi|schwartz|storybrand|brunson|epiphany bridge|grand slam|value equation' plugins); do
    ERRORS+=("$f: names an original author or method. Restate the idea in our own words")
  done
fi

# 9. The funnel core stays industry neutral: real estate specifics live only in its industry file
FUNNEL_CORE="plugins/marketing-os/skills/hi5-funnel/SKILL.md"
if [ -f "$FUNNEL_CORE" ] && grep -v 'Type (select:' "$FUNNEL_CORE" | grep -qiE 'fair housing|\bMLS\b|realtor|listing appointment'; then
  ERRORS+=("hi5-funnel/SKILL.md contains real estate specifics. Move them to industries/real-estate.md")
fi

# 10. The bizreview core stays industry neutral: real estate specifics live only in its industry file
REVIEW_CORE="plugins/business-os/skills/hi5-bizreview/SKILL.md"
if [ -f "$REVIEW_CORE" ] && grep -qiE 'fair housing|\bMLS\b|realtor|listing appointment|\bGCI\b|brokerage' "$REVIEW_CORE"; then
  ERRORS+=("hi5-bizreview/SKILL.md contains real estate specifics. Move them to industries/real-estate.md")
fi

# 11. Template items: every item in the setup template spec must be matched by title in template copy mode, and setup must run the check
SETUP_DIR="plugins/business-os/skills/hi5-setup"
items_line=$(grep -m1 '^Template items:' "$SETUP_DIR/templates/workspace-build.md" | sed 's/^Template items: *//')
match_line=$(grep -m1 "^1. Open the member's copy" "$SETUP_DIR/templates/workspace-build.md")
if [ -z "$items_line" ]; then
  ERRORS+=("hi5-setup/templates/workspace-build.md has no Template items line")
else
  IFS=',' read -ra ITEMS <<< "$items_line"
  for item in "${ITEMS[@]}"; do
    item=$(echo "$item" | sed 's/^ *//; s/ *$//')
    [ -n "$item" ] && { echo "$match_line" | grep -qF "$item" || ERRORS+=("hi5-setup template item '$item' is not matched by title in template copy mode step 1"); }
  done
  grep -qF 'Template items' "$SETUP_DIR/SKILL.md" || ERRORS+=("hi5-setup/SKILL.md WORKSPACE CHECK does not use the Template items list")
fi

# 12. profile_version: the number in profile-changes.md must match the setup build and the master profile layout
cur=$(sed -n 's/^Current profile_version: \([0-9][0-9]*\).*/\1/p' "$SETUP_DIR/templates/profile-changes.md" | head -1)
if [ -z "$cur" ]; then
  ERRORS+=("hi5-setup/templates/profile-changes.md has no Current profile_version line")
else
  grep -qF "profile_version: $cur" "$SETUP_DIR/templates/workspace-build.md" || ERRORS+=("workspace-build.md does not start new profiles at profile_version: $cur")
  grep -qF "The current version is $cur." "$SETUP_DIR/templates/master-profile.md" || ERRORS+=("master-profile.md does not say the current version is $cur")
fi

# 13. Real estate only skills (hi5-re-) live only in real-estate-os, every skill in real-estate-os is hi5-re-, and each one follows the shared guardrails file
for skill_dir in plugins/*/skills/*/; do
  skill_name=$(basename "$skill_dir")
  plugin=$(basename "$(dirname "$(dirname "$skill_dir")")")
  case "$skill_name" in
    hi5-re-*) [ "$plugin" = "real-estate-os" ] || ERRORS+=("$skill_name: hi5-re- skills must live in plugins/real-estate-os");;
    *) [ "$plugin" = "real-estate-os" ] && ERRORS+=("$skill_name: every skill in real-estate-os must start with hi5-re-");;
  esac
  if [ "$plugin" = "real-estate-os" ]; then
    grep -q 'guardrails.md' "${skill_dir}SKILL.md" || ERRORS+=("$skill_name: SKILL.md does not point to references/guardrails.md")
    grep -qiE 'industry_flow' "${skill_dir}SKILL.md" || ERRORS+=("$skill_name: SKILL.md does not check industry_flow for real estate members")
  fi
done
[ -f plugins/real-estate-os/skills/hi5-re-crm/references/guardrails.md ] || ERRORS+=("real-estate-os is missing hi5-re-crm/references/guardrails.md")

# 14. Browser-assisted search is allowed in three places, the optional CMA step, the optional market jobs in hi5-re-daily, and the optional expired ranking in hi5-re-prospect, all on the member's own MLS login
if grep -rIl 'Claude for Chrome' plugins 2>/dev/null | grep -vE 'hi5-re-listing-appt/references/cma.md|hi5-re-daily/references/browser-jobs.md|hi5-re-prospect/references/expired-research.md' | grep -q .; then
  for f in $(grep -rIl 'Claude for Chrome' plugins | grep -vE 'hi5-re-listing-appt/references/cma.md|hi5-re-daily/references/browser-jobs.md|hi5-re-prospect/references/expired-research.md'); do
    ERRORS+=("$f: mentions Claude for Chrome. Browser-assisted search is allowed only in the optional CMA step, the optional market jobs in hi5-re-daily, and the optional expired ranking in hi5-re-prospect")
  done
fi

# 15. The Meta Housing rules in /hi5-re-ads and in /hi5-funnel must carry the same key limits
for f in plugins/real-estate-os/skills/hi5-re-ads/references/meta-housing.md plugins/marketing-os/skills/hi5-funnel/references/meta-special-categories.md; do
  for k in 'No targeting by age' 'No targeting by gender' 'ZIP' '15 miles' 'lookalike'; do
    grep -qi "$k" "$f" || ERRORS+=("$f: missing the Meta Housing limit '$k'")
  done
done
[ -f plugins/real-estate-os/skills/hi5-re-ads/references/meta-housing.md ] && grep -q 'never connect' plugins/real-estate-os/skills/hi5-re-ads/SKILL.md || ERRORS+=("hi5-re-ads: SKILL.md must say it never connects to an ad account")

# 16. The neighborhood fact file in /hi5-re-neighborhood keeps the same 8 section names as the setup template
for sec in 'Snapshot' 'Homes and Prices' 'Getting Around' 'Things to Do' 'Insider Notes' 'What Buyers, Renters, and Investors Should Ask' 'What Sellers and Landlords Should Know' 'Content Angles'; do
  for f in plugins/business-os/skills/hi5-setup/templates/neighborhood-profile.md plugins/real-estate-os/skills/hi5-re-neighborhood/templates/fact-file.md; do
    grep -qF "**$sec**" "$f" || ERRORS+=("$f: missing the neighborhood section '$sec'")
  done
done

# 17. Every writing skill carries the shared voice rule (Voice Library, one voice per piece, Hi5 rules win)
for d in plugins/marketing-os/skills/*/ plugins/content-os/skills/*/ plugins/real-estate-os/skills/*/; do
  sk=$(basename "$d")
  case "$sk" in hi5-seo|hi5-site-audit) continue;; esac
  grep -q '**Voice.**' "${d}SKILL.md" || ERRORS+=("$sk: SKILL.md is missing the shared voice rule")
  grep -q 'Voice Library' "${d}SKILL.md" || ERRORS+=("$sk: SKILL.md voice rule does not mention the Voice Library")
done
for f in SKILL.md references/generated-skill.md references/voice-guide.md templates/voice-library-entry.md; do
  [ -f "plugins/business-os/skills/hi5-voice-creator/$f" ] || ERRORS+=("hi5-voice-creator is missing $f")
done

# 20. Every writing skill carries the shared reader rule, and /hi5-self keeps its teammate profile files
for d in plugins/marketing-os/skills/*/ plugins/content-os/skills/*/ plugins/real-estate-os/skills/*/ plugins/business-os/skills/hi5-dashboard/; do
  sk=$(basename "$d")
  case "$sk" in hi5-seo|hi5-site-audit) continue;; esac
  grep -q '**Reader.**' "${d}SKILL.md" || ERRORS+=("$sk: SKILL.md is missing the shared reader rule")
  grep -q 'People database' "${d}SKILL.md" || ERRORS+=("$sk: SKILL.md reader rule does not mention the People database")
done
for f in references/teammate-profiles.md references/teammate-questions.md templates/person-page.md; do
  [ -f "plugins/business-os/skills/hi5-self/$f" ] || ERRORS+=("hi5-self is missing $f")
done
grep -q 'Estimated by' plugins/business-os/skills/hi5-self/references/teammate-profiles.md || ERRORS+=("hi5-self teammate profiles must keep the Estimated by label")
grep -q '### 👥 People' plugins/business-os/skills/hi5-setup/templates/workspace-build.md || ERRORS+=("workspace-build.md is missing the People database")

# 23. Every writing skill carries the no invented commitments rule
for d in plugins/marketing-os/skills/*/ plugins/content-os/skills/*/ plugins/real-estate-os/skills/*/ plugins/business-os/skills/hi5-dashboard/; do
  sk=$(basename "$d")
  case "$sk" in hi5-seo|hi5-site-audit) continue;; esac
  grep -q '**No invented commitments.**' "${d}SKILL.md" || ERRORS+=("$sk: SKILL.md is missing the no invented commitments rule")
done

# 24. hi5-email keeps its formatting choices, formatting rules, and platform output rules
EM="plugins/marketing-os/skills/hi5-email/references"
[ -f "$EM/platform-output.md" ] || ERRORS+=("hi5-email is missing references/platform-output.md")
grep -q 'Never send' "$EM/platform-output.md" 2>/dev/null || ERRORS+=("hi5-email platform-output.md must keep the never send rule")
grep -q 'inline styles only' "$EM/platform-output.md" 2>/dev/null || ERRORS+=("hi5-email platform-output.md must keep the inline styles only rule")
grep -q 'Formatting style' "$EM/intake.md" || ERRORS+=("hi5-email intake.md must ask the formatting style")
grep -q 'Emojis' "$EM/intake.md" || ERRORS+=("hi5-email intake.md must ask the emoji choice")
grep -q 'always italic' "$EM/rules.md" || ERRORS+=("hi5-email rules.md must keep the italic P.S. rule")
grep -q 'platform-output.md' plugins/marketing-os/skills/hi5-email/SKILL.md || ERRORS+=("hi5-email SKILL.md Step 5 must name platform-output.md")

# 25. Description length limits: skills 900 characters, plugins 450 characters
for f in plugins/*/skills/*/SKILL.md; do
  d=$(grep -m1 '^description: ' "$f" | tr -d '\r' | sed 's/^description: //')
  [ ${#d} -le 900 ] || ERRORS+=("$f: description is ${#d} characters, the limit is 900")
done
for f in plugins/*/.claude-plugin/plugin.json marketplace.json; do
  while IFS= read -r line; do
    d=$(printf '%s' "$line" | tr -d '\r' | sed 's/^ *"description": "//; s/",\{0,1\}$//')
    [ ${#d} -le 450 ] || ERRORS+=("$f: a plugin description is ${#d} characters, the limit is 450")
  done < <(grep '"description": "' "$f" | grep -v 'A suite of Claude plugins')
done

# 26. Content OS is one system in five skills, with the shared references and the core pipeline rules
for f in SKILL.md references/core.md references/setup.md references/setup-calendar.md references/plan.md references/research.md references/script.md references/pipeline.md references/notion-structure.md references/folders.md references/bridges.md references/covers.md references/learning-edits.md references/tasks.md; do
  [ -f "plugins/content-os/skills/hi5-content-plan/$f" ] || ERRORS+=("hi5-content-plan is missing $f")
done
for f in plugins/content-os/skills/hi5-video-edit/SKILL.md plugins/content-os/skills/hi5-youtube/SKILL.md plugins/content-os/skills/hi5-youtube/references/youtube-rules.md plugins/content-os/skills/hi5-social/SKILL.md plugins/content-os/skills/hi5-social/references/queue.md plugins/content-os/skills/hi5-social/references/repurpose.md plugins/content-os/skills/hi5-blog/SKILL.md; do
  [ -f "$f" ] || ERRORS+=("Content OS is missing $f")
done
n=$(ls -d plugins/content-os/skills/*/ | wc -l)
[ "$n" -eq 5 ] || ERRORS+=("Content OS must have exactly 5 skills, found $n")
for old in hi5-yt-plan hi5-yt-research hi5-yt-script hi5-yt-setup hi5-studio hi5-studio-edit hi5-studio-producer hi5-repurpose hi5-context; do
  [ ! -d "plugins/content-os/skills/$old" ] || ERRORS+=("the old skill $old must be gone")
done
if grep -rnE '/hi5-(yt-|studio|repurpose)|hi5-context' plugins README.md marketplace.json .claude-plugin >/dev/null 2>&1; then ERRORS+=("old Content OS skill names are still referenced"); fi
if grep -rnwE 'Studio' plugins README.md marketplace.json .claude-plugin | grep -v 'YouTube Studio' >/dev/null 2>&1; then ERRORS+=("the word Studio must not appear (except YouTube Studio)"); fi
grep -q 'Nothing is scheduled before Optimizing' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md must keep the nothing scheduled before Optimizing rule")
grep -q 'Never write captions' plugins/content-os/skills/hi5-content-plan/references/plan.md || ERRORS+=("plan.md must keep the never write captions rule")
grep -q 'Edit Log' plugins/content-os/skills/hi5-content-plan/references/learning-edits.md || ERRORS+=("learning-edits.md must keep the Edit Log")
grep -q 'Pre-review check' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md must keep the Pre-review check")
grep -q 'check passed' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md must keep the check passed log line")
for f in plugins/content-os/skills/hi5-video-edit/SKILL.md plugins/content-os/skills/hi5-youtube/SKILL.md plugins/content-os/skills/hi5-social/references/queue.md plugins/content-os/skills/hi5-blog/SKILL.md plugins/content-os/skills/hi5-content-plan/references/plan.md; do
  grep -q 'pre-review check' "$f" || ERRORS+=("$f must run the pre-review check")
done
for t in capcut_save_draft upload_youtube_video list_youtube_channels create_post list_social_accounts; do
  grep -q "$t" plugins/content-os/skills/hi5-content-plan/references/bridges.md || ERRORS+=("bridges.md must name the exact tool $t")
done
grep -q 'synced_folder_path' plugins/content-os/skills/hi5-content-plan/references/folders.md || ERRORS+=("folders.md must name the synced folder path")
grep -q 'Edit Due = 48 hours' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md must keep the Edit Due 48 hours rule")
if grep -rnE '7 days before|edit_turnaround_days' plugins/content-os >/dev/null 2>&1; then ERRORS+=("the 7 day Edit Due rule must be gone from Content OS"); fi
grep -q 'Clip Publish Date' plugins/content-os/skills/hi5-content-plan/references/plan.md || ERRORS+=("plan.md must leave clip dates to the formula")
grep -q 'Do you have a day you batch record' plugins/content-os/skills/hi5-content-plan/references/plan.md || ERRORS+=("plan.md must ask about a batch record day")
grep -q 'Skill vs SOP' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md must keep the Skill vs SOP rule")
grep -q 'Clips post daily after the long-form' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md must keep the daily clips SOP line")
grep -q 'Canva' plugins/content-os/skills/hi5-content-plan/references/covers.md || ERRORS+=("covers.md must keep the Canva option")
grep -q 'skip for now' plugins/content-os/skills/hi5-content-plan/references/setup-calendar.md || ERRORS+=("setup-calendar.md must ask for examples and accept skip for now")
grep -qi 'brokerage' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md pre-review check must apply the Compliance page brokerage rules")
if grep -rnE '\beXp\b' plugins/content-os >/dev/null 2>&1; then ERRORS+=("Content OS files must not hardcode a brokerage"); fi
grep -q 'Never claim' plugins/content-os/skills/hi5-content-plan/references/bridges.md || grep -q 'Never claim a bridge' plugins/content-os/skills/hi5-content-plan/references/bridges.md || ERRORS+=("bridges.md must keep the never claim a bridge rule")
for sk in hi5-content-plan hi5-video-edit hi5-social hi5-youtube hi5-blog; do
  grep -q 'What do you want to do?' plugins/content-os/skills/$sk/SKILL.md || ERRORS+=("$sk must open with a menu")
  grep -q 'Works on its own' plugins/content-os/skills/$sk/SKILL.md || ERRORS+=("$sk must say it works on its own for one-off requests")
  grep -q 'Check my queue' plugins/content-os/skills/$sk/SKILL.md || ERRORS+=("$sk must have Check my queue")
done
grep -q 'role_video_editing' plugins/content-os/skills/hi5-content-plan/references/pipeline.md || ERRORS+=("pipeline.md must define the per-role owner setting")

# 21. The org chart skill keeps its files, the one human manager rule, and the AI Employees database
for f in SKILL.md references/interview.md references/chart-artifact.md references/highlights.md references/edits.md; do
  [ -f "plugins/business-os/skills/hi5-org-chart/$f" ] || ERRORS+=("hi5-org-chart is missing $f")
done
grep -q 'exactly one human manager' plugins/business-os/skills/hi5-org-chart/SKILL.md || ERRORS+=("hi5-org-chart/SKILL.md must keep the exactly one human manager rule")
grep -q 'AI Operations' plugins/business-os/skills/hi5-org-chart/SKILL.md || ERRORS+=("hi5-org-chart/SKILL.md must keep the optional AI Operations suggestion")
grep -q '### 🤖 AI Employees' plugins/business-os/skills/hi5-setup/templates/workspace-build.md || ERRORS+=("workspace-build.md is missing the AI Employees database")

# 22. The bottleneck skill keeps its files, the fix ladder order, the platform rule, and the Bottlenecks database
for f in SKILL.md references/interview.md references/ranking.md references/fix-ladder.md references/quick-win.md references/platform-instructions.md references/ai-employees.md templates/job-description.md templates/project-instructions.md industries/real-estate.md industries/generic.md; do
  [ -f "plugins/business-os/skills/hi5-bottleneck/$f" ] || ERRORS+=("hi5-bottleneck is missing $f")
done
grep -q 'never change their CRM or platform' plugins/business-os/skills/hi5-bottleneck/SKILL.md || ERRORS+=("hi5-bottleneck/SKILL.md must keep the never change their CRM or platform rule")
grep -q 'exactly one human manager' plugins/business-os/skills/hi5-bottleneck/SKILL.md || ERRORS+=("hi5-bottleneck/SKILL.md must keep the exactly one human manager rule")
grep -q 'Check Hi5 first' plugins/business-os/skills/hi5-bottleneck/SKILL.md || ERRORS+=("hi5-bottleneck/SKILL.md must keep the check Hi5 first rule")
grep -q '### 🚧 Bottlenecks' plugins/business-os/skills/hi5-setup/templates/workspace-build.md || ERRORS+=("workspace-build.md is missing the Bottlenecks database")

# 18. The dashboard skill keeps its discovery, widget library, email actions, Notion rules, and the no repeated connector prompt test
for f in SKILL.md references/discovery.md references/widgets.md references/email-actions.md references/notion-trackers.md references/build.md references/connectors.md references/menu.md references/tasks.md references/email-tasks.md references/dashboard-content.md industries/real-estate.md industries/generic.md; do
  [ -f "plugins/business-os/skills/hi5-dashboard/$f" ] || ERRORS+=("hi5-dashboard is missing $f")
done
grep -q 'two-open test' plugins/business-os/skills/hi5-dashboard/references/build.md || ERRORS+=("hi5-dashboard/references/build.md must keep the two-open test for repeated connector prompts")
grep -q 'If you saw this, what would you do' plugins/business-os/skills/hi5-dashboard/references/discovery.md || ERRORS+=("hi5-dashboard/references/discovery.md must keep the action filter")

# 19. The Follow-Up Queue keeps one message per click, no bulk or automatic sending, and its spec file
[ -f plugins/business-os/skills/hi5-dashboard/references/follow-up-queue.md ] || ERRORS+=("hi5-dashboard is missing references/follow-up-queue.md")
grep -q 'No Send all, ever' plugins/business-os/skills/hi5-dashboard/SKILL.md || ERRORS+=("hi5-dashboard/SKILL.md must keep the No Send all rule")
grep -q 'Send all' plugins/business-os/skills/hi5-dashboard/references/follow-up-queue.md || ERRORS+=("hi5-dashboard/references/follow-up-queue.md must keep the no Send all rule")


# 27. Hi5 skills first: every description carries everyday phrases, setup shows the Hi5 first line, and the Skill Guide is gone (skills live in the Hi5 Vault)
for f in plugins/*/skills/*/SKILL.md; do
  d=$(grep -m1 '^description: ' "$f" | tr -d '\r' | sed 's/^description: //')
  q=$(printf '%s' "$d" | tr -cd '"' | wc -c)
  [ "$q" -ge 10 ] || ERRORS+=("$f: the description needs at least 5 quoted everyday phrases members actually say, found $((q / 2))")
done
SD="plugins/business-os/skills/hi5-setup"
for f in references/hi5-first.md; do
  [ -f "$SD/$f" ] || ERRORS+=("hi5-setup is missing $f")
done
grep -q "When a Hi5 skill fits what I'm asking, use it first" "$SD/references/hi5-first.md" 2>/dev/null || ERRORS+=("hi5-first.md must carry the Hi5 first line")
grep -q 'personal preferences' "$SD/references/hi5-first.md" 2>/dev/null || ERRORS+=("hi5-first.md must say where to paste the line")
grep -q "can't change your Claude settings" "$SD/references/hi5-first.md" 2>/dev/null || ERRORS+=("hi5-first.md must say Claude cannot change the setting")
grep -q 'hi5_first_shown' "$SD/SKILL.md" || ERRORS+=("hi5-setup SKILL.md must note that the Hi5 first line was shown")
grep -q 'hi5_first_shown' "$SD/templates/master-profile.md" || ERRORS+=("master-profile.md must list hi5_first_shown")
grep -q 'hi5-first.md' "$SD/SKILL.md" || ERRORS+=("hi5-setup SKILL.md must run hi5-first.md")
[ ! -f "$SD/references/skill-guide.md" ] || ERRORS+=("skill-guide.md must be gone (the Skill Guide moved to the Hi5 Vault)")
grep -q 'vault.hi5success.com' "$SD/SKILL.md" || ERRORS+=("hi5-setup SKILL.md must point to vault.hi5success.com")
if grep -rn 'skill_guide_page_id' plugins --include=*.md | grep -v 'no longer used' | grep -q .; then ERRORS+=("skill_guide_page_id may only appear as no longer used")
fi
if grep -n 'Skill Guide' "$SD/templates/workspace-build.md" | grep -viE 'removed|no longer|never|older|moved|Vault' | grep -q .; then ERRORS+=("workspace-build.md must not build or match the Skill Guide")
fi
grep -q 'template_version: 3' "$SD/templates/workspace-build.md" || ERRORS+=("workspace-build.md must set template_version 3")
for id in tasks_db_id sops_db_id software_stack_db_id offers_db_id proof_db_id decisions_log_db_id ai_memory_db_id brain_index_page_id client_meetings_db_id internal_meetings_db_id; do
  grep -q "$id" "$SD/templates/workspace-build.md" || ERRORS+=("workspace-build.md must save $id")
  grep -q "$id" "$SD/templates/master-profile.md" || ERRORS+=("master-profile.md must list $id")
done
grep -q 'Not Started, Brainstorming, Ready to Edit, In Progress, Reviewing, Revising, Finalizing, Optimizing, Scheduled, Published' "$SD/templates/workspace-build.md" || ERRORS+=("workspace-build.md must carry the exact Content Planner status list")
for p in content-os marketing-os real-estate-os; do
  cmp -s plugins/business-os/references/brain-rules.md "plugins/$p/references/brain-rules.md" || ERRORS+=("brain-rules.md in $p must match the business-os copy")
done
for f in plugins/*/skills/*/SKILL.md; do
  case "$f" in */hi5-next/*|*/hi5-re-daily/*|*/hi5-re-roleplay/*|*/hi5-connector/*|plugins/youtube/*) continue;; esac
  grep -q 'brain-rules.md' "$f" || ERRORS+=("$f must tell the skill to read brain-rules.md before it saves")
done
grep -q "When a Hi5 skill fits what I'm asking, use it first" plugins/business-os/skills/hi5-bottleneck/templates/project-instructions.md || ERRORS+=("the AI employee Project instructions template must carry the Hi5 first line")

# 28. Content OS: every skill carries the same hard rules (copies must match), and every relative path to a shared file resolves inside the plugin
HR_REF=""
for sk in hi5-content-plan hi5-video-edit hi5-social hi5-youtube hi5-blog; do
  hr=$(sed -n '/<!-- hard-rules:start -->/,/<!-- hard-rules:end -->/p' "plugins/content-os/skills/$sk/SKILL.md" | tr -d '\r')
  [ -n "$hr" ] || { ERRORS+=("$sk: SKILL.md is missing the hard rules block"); continue; }
  if [ -z "$HR_REF" ]; then HR_REF="$hr"; elif [ "$hr" != "$HR_REF" ]; then ERRORS+=("$sk: the hard rules block does not match the other content skills"); fi
done
for f in $(find plugins -name '*.md'); do
  sk=$(echo "$f" | sed -n 's#^\(plugins/[^/]*/skills/[^/]*\)/.*#\1#p')
  [ -n "$sk" ] || continue
  for ref in $(grep -o '\.\./[A-Za-z0-9_./-]*\.md' "$f" | sort -u); do
    plug=$(realpath -m "$(echo "$sk" | cut -d/ -f1-2)")
    t1=$(realpath -m "$sk/$ref"); t2=$(realpath -m "$(dirname "$f")/$ref")
    ok=""
    for tgt in "$t1" "$t2"; do
      case "$tgt" in "$plug"/*) [ -f "$tgt" ] && ok=1;; esac
    done
    [ -n "$ok" ] || ERRORS+=("$f: $ref does not resolve to a file inside its plugin (a plugin install would not have it)")
  done
done

# 29. The advisory board skills keep the exact database syntax, data source IDs, industry neutrality, and the dollar sign rule
BD="plugins/business-os/skills"
NR="$BD/hi5-advisor/references/notion.md"
for id in coach_library_ds_id advisory_board_ds_id board_meetings_ds_id; do
  grep -q "$id" "$NR" || ERRORS+=("notion.md must name $id")
done
grep -q 'CREATE TABLE' "$NR" || ERRORS+=("notion.md must give the exact create syntax")
for t in Marketing Sales Pricing Hiring Money Systems Content Mindset Leadership 'Customer service' Offers Partnerships; do
  grep -q "'$t'" "$NR" || ERRORS+=("notion.md must seed the Topic $t")
done
grep -q 'folder URL' "$BD/hi5-library/SKILL.md" || ERRORS+=("hi5-library must save the folder URL")
grep -q 'master_coach_refresh_declined' "$BD/hi5-board/SKILL.md" || ERRORS+=("hi5-board must save master_coach_refresh_declined")
grep -q 'Industry Expert' "$BD/hi5-advisor/templates/starter-roles.md" || ERRORS+=("starter-roles.md must carry the Industry Expert")
grep -q 'HIPAA' "$BD/hi5-board/SKILL.md" || ERRORS+=("hi5-board must name the member's compliance rules, not only Fair Housing")
grep -q 'Notion meeting page is the report' "$BD/hi5-board/SKILL.md" || ERRORS+=("hi5-board must have the report fallback")
grep -q 'Words read' "$NR" || ERRORS+=("notion.md must carry the Words read checkbox")
grep -q 'Words read' "$BD/hi5-library/SKILL.md" || ERRORS+=("hi5-library must use the Words read checkbox")
grep -q 'Where creators disagree' "$BD/hi5-advisor/references/brain-spec.md" || ERRORS+=("brain-spec.md must carry the Where creators disagree section")
grep -q 'L01' "$BD/hi5-advisor/references/brain-spec.md" || ERRORS+=("brain-spec.md must define the Master Coach library source ids")
grep -q 'Empty board' "$BD/hi5-advisor/SKILL.md" || ERRORS+=("hi5-advisor must go straight to the default board on an empty board")
for sk in hi5-library hi5-advisor hi5-board; do
  grep -q 'Dollar signs' "$BD/$sk/SKILL.md" || ERRORS+=("$sk must carry the dollar sign rule")
done

# 30. The dashboard keeps its menu, separate dashboards, email hard rules, email to task, one task home, content dashboard, and potential revenue rules
DB="plugins/business-os/skills/hi5-dashboard"
grep -q 'Menu first' "$DB/SKILL.md" || ERRORS+=("hi5-dashboard SKILL.md must keep the menu first rule")
grep -q 'Separate dashboards' "$DB/SKILL.md" || ERRORS+=("hi5-dashboard SKILL.md must keep the separate dashboards rule")
grep -q 'Never link or redirect to Gmail' "$DB/SKILL.md" || ERRORS+=("hi5-dashboard SKILL.md must keep the email hard rule: never link to Gmail")
grep -q 'Never link or redirect to Gmail' "$DB/references/email-actions.md" || ERRORS+=("email-actions.md must keep the never link to Gmail rule")
grep -q 'recent threads with the same sender' "$DB/references/email-actions.md" || ERRORS+=("email-actions.md must read recent threads with the same sender for context")
grep -q 'Send is one click per message' "$DB/references/email-actions.md" || ERRORS+=("email-actions.md must keep send is one click per message")
grep -q 'No reply needed' "$DB/references/email-tasks.md" || ERRORS+=("email-tasks.md must close the task on No reply needed")
grep -q 'scheduled task' "$DB/references/email-tasks.md" || ERRORS+=("email-tasks.md must offer the scheduled task")
grep -q 'Where do you keep your tasks' "$DB/references/tasks.md" || ERRORS+=("tasks.md must ask where the member keeps tasks")
grep -q 'Never split tasks across two places' "$DB/references/tasks.md" || ERRORS+=("tasks.md must keep tasks in one place")
grep -q 'never reads local bridges' "$DB/references/dashboard-content.md" || grep -q 'never read.*local bridges' "$DB/references/dashboard-content.md" || ERRORS+=("dashboard-content.md must never read local bridges")
grep -q 'Potential, not guaranteed' "$DB/references/widgets.md" || ERRORS+=("widgets.md must label potential revenue as potential, not guaranteed")
grep -q 'commission_per_side' "$DB/industries/real-estate.md" || ERRORS+=("real-estate.md must use the member's own commission per side")
grep -q 'split_to_member' "$DB/references/widgets.md" || ERRORS+=("widgets.md potential revenue must use split_to_member")
grep -q 'Status Changed' "$DB/references/dashboard-content.md" || ERRORS+=("dashboard-content.md stuck must use Status Changed")
grep -q 'tasks_db_id' "$DB/references/tasks.md" || ERRORS+=("tasks.md must save tasks_db_id")
grep -q 'Create the contact' "$DB/references/tasks.md" || ERRORS+=("tasks.md must ask before creating a GoHighLevel contact")
grep -q 'not signed in' "$DB/references/tasks.md" || ERRORS+=("tasks.md must handle a connector that is not signed in")
grep -q 'Not published yet' "$DB/references/build.md" || ERRORS+=("build.md must say Not published yet for a draft dashboard")
if grep -rniE 'open in gmail|mail\.google\.com|gmail\.com/mail' "$DB" | grep -viE 'never|no "open in gmail"|not ' >/dev/null; then ERRORS+=("hi5-dashboard must not link to Gmail"); fi

# 31. Connectors OS: no secrets or machine files shipped, no personal paths, versions and changelogs agree,
#     the plugin registers each connector through its launcher, and the skill keeps its hard rules
CO="plugins/connectors-os"
if [ -d "$CO" ]; then
  # The CapCut draft template keeps its own draft_info.json.bak (CapCut expects it), so bridge/template/ is exempt from the .bak rule.
  bad=$(git ls-files "$CO" | grep -E '(^|/)(node_modules|venv[^/]*|dist|__pycache__|\.git)/|(^|/)(\.env|accounts\.json|accounts\.dat|config\.json|settings\.json|installed\.json)$|\.(bak|mcpb|log)$' | grep -v '/bridge/template/')
  [ -z "$bad" ] || ERRORS+=("connectors-os ships files that must stay on the member's computer: $(echo $bad | tr '\n' ' ')")
  if git ls-files "$CO" | xargs grep -lIiE 'jshir|Jacob Shireman|G:\\\\Shared drives|sunguannan' 2>/dev/null | grep -v 'draft_meta_info.json' | grep -q .; then
    ERRORS+=("connectors-os contains a personal path or name: $(git ls-files "$CO" | xargs grep -lIiE 'jshir|Jacob Shireman|G:\\\\Shared drives|sunguannan' | grep -v draft_meta_info.json | tr '\n' ' ')")
  fi
  for c in capcut ghl-social; do
    [ -f "$CO/connectors/$c/connector.json" ] || ERRORS+=("connectors-os: $c is missing connector.json")
    [ -f "$CO/connectors/$c/launch.mjs" ] || ERRORS+=("connectors-os: $c is missing launch.mjs")
    grep -q "connectors/$c/launch.mjs" "$CO/.claude-plugin/plugin.json" || ERRORS+=("connectors-os plugin.json must register $c through its launcher")
  done
  if command -v node >/dev/null 2>&1; then
    node_out=$(node -e '
      const fs=require("fs");
      for (const c of ["capcut","ghl-social"]) {
        const j=JSON.parse(fs.readFileSync("plugins/connectors-os/connectors/"+c+"/connector.json","utf8"));
        if (!/^\d+\.\d+\.\d+$/.test(j.version)) console.log(c+": connector.json version must be x.y.z");
        if (!j.changelog || j.changelog[0].version!==j.version) console.log(c+": the first changelog entry must match the connector version");
      }' 2>&1)
    [ -n "$node_out" ] && while IFS= read -r l; do ERRORS+=("$l"); done <<< "$node_out"
  fi
  [ ! -f "$CO/connectors/capcut/mcp-server/src/tools/join.ts" ] || ERRORS+=("connectors-os: capcut_join_parts was dropped, join.ts must stay out")
  grep -q 'os.homedir()' "$CO/connectors/capcut/mcp-server/src/tools/move.ts" || ERRORS+=("move.ts must use the member's own home folder")
  grep -q 'write_draft_meta' "$CO/connectors/capcut/bridge/save_draft_impl.py" || ERRORS+=("save_draft_impl.py must give every draft its own name and ID")
  grep -q 'HI5_MARKER' "$CO/connectors/capcut/bridge/save_draft_impl.py" || ERRORS+=("save_draft_impl.py must never replace a project the member made")
  grep -q 'ProtectedData' "$CO/connectors/ghl-social/launch.mjs" || ERRORS+=("ghl-social launch.mjs must read the Windows-encrypted accounts")
  grep -q 'npm ci --ignore-scripts' "$CO/install/hi5-connector.ps1" || ERRORS+=("the installer must build with npm ci --ignore-scripts")
  grep -q ".hi5-connector" "$CO/install/hi5-connector.ps1" || ERRORS+=("the installer must install into the .hi5-connector user folder, not AppData")
  if grep -nE 'claude_desktop_config' "$CO/install/hi5-connector.ps1" "$CO"/connectors/*/launch.mjs >/dev/null; then ERRORS+=("connectors-os must never edit Claude's config files"); fi
  CS="$CO/skills/hi5-connector/SKILL.md"
  grep -q 'Which connector would you like to install?' "$CS" || ERRORS+=("hi5-connector must ask which connector to install")
  grep -q 'Only the installer installs' "$CS" || ERRORS+=("hi5-connector must keep the only-the-installer-installs rule")
  grep -q 'Never ask for a token in the chat' "$CS" || ERRORS+=("hi5-connector must never ask for a token in the chat")
  grep -q 'Ask before installing other programs' "$CS" || ERRORS+=("hi5-connector must ask before installing other programs")
  [ -f "$CO/skills/hi5-connector/references/ghl-token.md" ] || ERRORS+=("hi5-connector is missing references/ghl-token.md")
  for s in socialplanner/post.write socialplanner/post.readonly socialplanner/account.readonly medias.write medias.readonly locations.readonly users.readonly; do
    grep -q "$s" "$CO/skills/hi5-connector/references/ghl-token.md" || ERRORS+=("ghl-token.md must list the $s scope")
  done
fi

if [ ${#ERRORS[@]} -gt 0 ]; then
  echo ""
  echo "Validation failed. Fix the following:"
  echo ""
  for err in "${ERRORS[@]}"; do echo "  - $err"; done
  echo ""
  exit 1
fi
echo "All checks passed."
