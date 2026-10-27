#!/usr/bin/env bash
# Claude Code status line: model | ctx | branch | changes | rate limits.
# Colors come from the Ethereal theme (see lazyvim-clean/.config/nvim/colors/ethereal.lua).
input=$(cat)

fg() { printf '\e[38;2;%d;%d;%dm' "0x${1:0:2}" "0x${1:2:2}" "0x${1:4:2}"; }
reset=$'\e[0m'

c_model=$(fg 7d82d9)
c_ctx=$(fg 6d7db6)
c_branch=$(fg c89dc1)
c_changes=$(fg eb8b54)
c_rate=$(fg E9BB4F)
c_sep=$(fg 363b69)

IFS=$'\t' read -r dir model used five_pct week_pct < <(
  echo "$input" | jq -r '[
    (.workspace.current_dir // .cwd // ""),
    (.model.display_name // ""),
    (.context_window.used_percentage // ""),
    (.rate_limits.five_hour.used_percentage // ""),
    (.rate_limits.seven_day.used_percentage // "")
  ] | @tsv'
)

parts=()
[ -n "$model" ] && parts+=("${c_model}${model}${reset}")
[ -n "$used" ] && parts+=("${c_ctx}$(printf 'ctx:%.0f%%' "$used")${reset}")

if [ -n "$dir" ] && git -C "$dir" rev-parse --is-inside-work-tree &>/dev/null; then
  branch=$(git -C "$dir" branch --show-current 2>/dev/null)
  [ -z "$branch" ] && branch=$(git -C "$dir" rev-parse --short HEAD 2>/dev/null)
  [ -n "$branch" ] && parts+=("${c_branch}⎇ ${branch}${reset}")

  read -r added removed < <(
    git -C "$dir" diff HEAD --numstat 2>/dev/null |
      awk '{a += $1; r += $2} END {printf "%d %d\n", a, r}'
  )
  parts+=("${c_changes}(+${added:-0},-${removed:-0})${reset}")
fi

rate=()
[ -n "$five_pct" ] && rate+=("$(printf '5h:%.0f%%' "$five_pct")")
[ -n "$week_pct" ] && rate+=("$(printf '7d:%.0f%%' "$week_pct")")
[ ${#rate[@]} -gt 0 ] && parts+=("${c_rate}${rate[*]}${reset}")

sep=" ${c_sep}|${reset} "
out=""
for p in "${parts[@]}"; do
  out+="${out:+$sep}$p"
done
printf '%s' "$out"
