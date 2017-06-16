
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.airline.sh
set -o vi

export GIT="https://github.com"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
