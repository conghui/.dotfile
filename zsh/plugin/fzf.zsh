_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # make sure fzf and rg exits
  [[ -f ~/.fzf.zsh ]] && \
    which fzf &> /dev/null && \
    which rg &> /dev/null && \
    source ~/.fzf.zsh

  # Setting rg as the default source for fzf
  export FZF_DEFAULT_COMMAND="rg  --files --color=always"

  # Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
   --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
   --ansi
  "

  # Solarized Dark color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #   --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #   --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  #   --ansi
  # "

  # To apply the command to CTRL-T as well
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}
_gen_fzf_default_opts
