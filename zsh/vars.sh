# vim: fdm=marker fdl=0 ft=zsh

# variables# {{{
EDITOR="vim"
TERM="xterm-256color"
PAGER="less"
export DOTFILE_ROOT=${HOME}/.dotfile
export ZSH_ROOT=${DOTFILE_ROOT}/zsh
export DOTFILE_BUNDLE_ROOT=${DOTFILE_ROOT}/gundle/
export INSTALL_ROOT=${HOME}/softs/install/
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export NUM_CORES=`grep -c '^processor' /proc/cpuinfo`
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export NUM_CORES=`sysctl -n hw.ncpu`
fi
# }}}

# aliases# {{{
source ${ZSH_ROOT}/aliases.sh
# }}}
# functions# {{{
function prepend_PATH() { # {{{
  export PATH=${@}:${PATH}
} # }}}
function prepend_LD_LIBRARY_PATH() { # {{{
  export LD_LIBRARY_PATH=${@}:${LD_LIBRARY_PATH}
} # }}}
function prepend_MANPATH() { # {{{
  export MANPATH=${@}:${MANPATH}
} # }}}
function prepend_bin_man() { # {{{
  prepend_PATH ${1}/bin
  prepend_MANPATH ${1}/man
} # }}}
function prepend_bin_shareman() { # {{{
  prepend_PATH ${1}/bin
  prepend_MANPATH ${1}/share/man
} # }}}
function prepend_bin_lib64() { # {{{
  prepend_PATH ${1}/bin
  prepend_LD_LIBRARY_PATH ${1}/lib64
} # }}}
function prepend_p_l_m() { # {{{
  prepend_PATH ${1}
  prepend_LD_LIBRARY_PATH ${2}
  prepend_MANPATH ${3}
} # }}}
function prepend_bin_lib_shareman() { # {{{
  prepend_p_l_m ${1}/bin ${1}/lib ${1}/share/man
} # }}}
function prepend_bin_lib64_shareman() { # {{{
  prepend_p_l_m ${1}/bin ${1}/lib64 ${1}/share/man
} # }}}
function prepend_bin_lib_man() { # {{{
  prepend_p_l_m ${1}/bin ${1}/lib ${1}/man
} # }}}
function source_if_exist() { # {{{
  if [[ -f ${1} ]]; then
    source "$@" &> /dev/null
  fi
} # }}}
function setup_osx() { # {{{
  if command -v brew &> /dev/null; then
    prepend_PATH "$(brew --prefix coreutils)/libexec/gnubin"
  fi
} # }}}
# }}}

# path and library setup
# setup osx# {{{
setup_osx
# }}}
# /usr/sbin # {{{
prepend_PATH /usr/sbin/
# }}}
# /sbin# {{{
prepend_PATH /sbin/
# }}}
# /usr/local/bin# {{{
prepend_bin_man /usr/local
# }}}
# vim# {{{
prepend_bin_shareman ${INSTALL_ROOT}/vim
# }}}
# madagascar# {{{
source_if_exist ${INSTALL_ROOT}/madagascar/share/madagascar/etc/env.sh
# }}}
# python# {{{
prepend_bin_lib_shareman ${INSTALL_ROOT}/Python
export PYTHONSTARTUP=~/.pystartup
# }}}
# ruby# {{{
prepend_bin_lib_shareman ${INSTALL_ROOT}/ruby
# }}}
# scons# {{{
prepend_bin_man ${INSTALL_ROOT}/scons
# }}}
# CUDA# {{{
prepend_bin_lib64 ${INSTALL_ROOT}/cuda
# }}}
# cwp_su# {{{
export CWPROOT=${INSTALL_ROOT}/cwp_su_all
prepend_PATH ${CWPROOT}/bin
# }}}
# intel toolkits# {{{
INTEL_ROOT=${INSTALL_ROOT}/intel
source_if_exist ${INTEL_ROOT}/composerxe/bin/compilervars.sh intel64
source_if_exist ${INTEL_ROOT}/impi/bin64/mpivars.sh
source_if_exist ${INTEL_ROOT}/vtune_amplifier_xe/amplxe-vars.sh quiet
source_if_exist ${INTEL_ROOT}/inspector_xe/inspxe-vars.sh quiet
# }}}
# gpu-based mpi# {{{
prepend_bin_lib_shareman ${INSTALL_ROOT}/mpi
# }}}
# boost# {{{
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/boost/lib
# }}}
# maxcompiler# {{{
source_if_exist ${INSTALL_ROOT}/maxcompiler/settings.sh
# }}}
# texlive# {{{
TEXLIVE_ROOT=${INSTALL_ROOT}/texlive
prepend_PATH    ${TEXLIVE_ROOT}/bin/x86_64-linux
prepend_MANPATH ${TEXLIVE_ROOT}/texmf/doc/man
# }}}
# opencv# {{{
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/opencv/lib
# }}}
# git# {{{
prepend_bin_shareman ${INSTALL_ROOT}/git
# }}}
# valgrind# {{{
prepend_bin_man ${INSTALL_ROOT}/valgrind
# }}}
# cmake# {{{
prepend_PATH ${INSTALL_ROOT}/cmake/bin
# }}}
# tmux# {{{
prepend_PATH ${INSTALL_ROOT}/tmux/bin
# }}}
# gnuplot# {{{
prepend_bin_shareman ${INSTALL_ROOT}/gnuplot
# }}}
# gnu parallel# {{{
prepend_bin_shareman ${INSTALL_ROOT}/parallel
# }}}
# zsh# {{{
prepend_bin_lib_shareman ${INSTALL_ROOT}/zsh
# }}}
# matlab# {{{
prepend_PATH ${INSTALL_ROOT}/matlab/bin
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/runtime/glnxa64
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/bin/glnxa64
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/sys/os/glnxa64
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/sys/opengl/lib/glnxa64
# }}}
# gcc# {{{
prepend_bin_lib64_shareman ${INSTALL_ROOT}/gcc
export LD_RUN_PATH=${INSTALL_ROOT}/gcc/lib64:${LD_RUN_PATH}
# }}}
# curl# {{{
prepend_bin_lib_shareman ${INSTALL_ROOT}/curl
# }}}
# dfe-snippets# {{{
PATH_TO_DFE_SNIPPETS=${HOME}/dfe-snippets/
prepend_PATH ${PATH_TO_DFE_SNIPPETS}/scripts/
# }}}
# ${HOME}/.local/bin# {{{
prepend_PATH ${HOME}/.local/bin
# }}}
# ${HOME}/.dotfile/bin# {{{
prepend_PATH ${HOME}/.dotfile/bin
# }}}
