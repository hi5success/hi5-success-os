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

# 4. Every skill points members to /hi5-next (hi5-context is a reference file, not a command)
for skill_dir in plugins/*/skills/*/; do
  skill_name=$(basename "$skill_dir")
  [ "$skill_name" = "hi5-context" ] && continue
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
    [ "$skill_name" = "hi5-context" ] && continue
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
    # live skills must be in the README and the Skill Guide in workspace-build.md
    if [ "$status" = "live" ]; then
      grep -q "/$name" README.md || ERRORS+=("README.md does not list /$name")
      grep -q "/$name" plugins/business-os/skills/hi5-setup/templates/workspace-build.md || ERRORS+=("workspace-build.md (Dashboard and Skill Guide) does not list /$name")
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

# 14. Browser-assisted search is allowed in two places, the optional CMA step and the optional market jobs in hi5-re-daily, both on the member's own MLS login
if grep -rIl 'Claude for Chrome' plugins 2>/dev/null | grep -vE 'hi5-re-listing-appt/references/cma.md|hi5-re-daily/references/browser-jobs.md' | grep -q .; then
  for f in $(grep -rIl 'Claude for Chrome' plugins | grep -vE 'hi5-re-listing-appt/references/cma.md|hi5-re-daily/references/browser-jobs.md'); do
    ERRORS+=("$f: mentions Claude for Chrome. Browser-assisted search is allowed only in the optional CMA step and the optional market jobs in hi5-re-daily")
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
