if [[ -d "${HOME}/.Meow0x7E" ]] && command -v git 1>/dev/null; then
  alias keep='git --git-dir=${HOME}/.Meow0x7E/ --work-tree=${HOME}'
  alias syskeep='git --git-dir=/.system --work-tree=/'
fi
