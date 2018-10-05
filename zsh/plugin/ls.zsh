if [[ "$OSTYPE" == "darwin"* ]]; then # only set for MAC
  alias ls='ls --color=auto'
fi

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
