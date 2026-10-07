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

if [ ${#ERRORS[@]} -gt 0 ]; then
  echo ""
  echo "Validation failed. Fix the following:"
  echo ""
  for err in "${ERRORS[@]}"; do echo "  - $err"; done
  echo ""
  exit 1
fi
echo "All checks passed."
