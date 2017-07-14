[[ -f ~/.fzf.zsh ]] && which fzf &> /dev/null && source ~/.fzf.zsh
which ag &> /dev/null && export FZF_DEFAULT_COMMAND='ag -g ""'
