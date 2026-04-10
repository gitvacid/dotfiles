# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/git/completion/git-prompt.sh
PS1='\u@\h: \w $(__git_ps1 " (%s) ")\$ '

export FZF_DEFAULT_OPTS_FILE=~/.fzf_vague

alias ls='ls -lFh --color=auto'
alias la='ls -lAFh --color=auto'
alias grep='grep --color=auto'
alias swconf='nvim ~/.config/sway/config'
alias ff='fastfetch -c ~/.config/fastfetch/ff.jsonc'
alias updot='~/scripts/update_dots.sh'
alias chwall='~/scripts/change_wall.sh'

ff
