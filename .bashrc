# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\w]\$ '

alias ls='ls -lFh --color=auto'
alias la='ls -lAFh --color=auto'
alias grep='grep --color=auto'
alias swconf='nvim ~/.config/sway/config'
alias ff='fastfetch -c ~/.config/fastfetch/ff.jsonc'
alias updot='~/scripts/updatedots.sh'
