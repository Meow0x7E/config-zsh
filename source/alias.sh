#!/usr/bin/zsh

# ==========================================
# 钩子系统：条件类型由第二个参数指定
# ==========================================

typeset -a _HOOK_TYPES=()
typeset -a _HOOK_CONDS=()
typeset -a _HOOK_ACTIONS=()

register_hook() {
  local cond="$1"
  local type="${2:-command}" # 默认 command，可选 eval

  # 检查 type 合法性
  if [[ "$type" != "command" && "$type" != "eval" ]]; then
    printf -u 2 "register_alias_hook: type must be 'command' or 'eval'"
    return 1
  fi

  # 从 stdin 读取动作（必须提供）
  local action
  action="$(cat)"
  if [[ -z "$action" ]]; then
    echo "register_hook: no action provided (stdin is empty)" >&2
    return 1
  fi

  # 存入数组
  _HOOK_TYPES+=("$type")
  _HOOK_CONDS+=("$cond")
  _HOOK_ACTIONS+=("$action")
}

run_hooks() {
  [[ -n "$_HOOKS_RAN" ]] && return
  typeset -g _HOOKS_RAN=1

  local i
  local missing=()

  for ((i = 1; i <= $#_HOOK_TYPES; i++)); do
    local type="${_HOOK_TYPES[i]}"
    local cond="${_HOOK_CONDS[i]}"
    local action="${_HOOK_ACTIONS[i]}"

    local satisfied=false
    if [[ "$type" == "command" ]]; then
      if command -v "$cond" &>/dev/null; then
        satisfied=true
      else
        missing+=("$cond")
      fi
    else # eval
      if eval "$cond" &>/dev/null; then
        satisfied=true
      else
        missing+=("[eval] $cond")
      fi
    fi

    if [[ "$satisfied" == true ]]; then
      eval "$action"
    fi
  done

  if [[ -n "${HOOK_LOG:-}" ]] && [[ ${#missing[@]} -gt 0 ]]; then
    echo "🔧 Hook conditions not met:" >&2
    printf '  - %s\n' "${missing[@]}" >&2
  fi

  unset _HOOK_TYPES _HOOK_CONDS _HOOK_ACTIONS
}
