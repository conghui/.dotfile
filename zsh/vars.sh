export DOTFILE_ROOT=${HOME}/.dotfile
source ${DOTFILE_ROOT}/zsh/aliases.sh

function prepend_PATH()
{
  export PATH=${@}:${PATH}
}

function prepend_LD_LIBRARY_PATH()
{
  export LD_LIBRARY_PATH=${@}:${LD_LIBRARY_PATH}
}

function prepend_MANPATH()
{
  export MANPATH=${@}:${MANPATH}
}

function prepend_bin_man()
{
  prepend_PATH ${1}/bin
  prepend_MANPATH ${1}/man
}

function prepend_bin_shareman()
{
  prepend_PATH ${1}/bin
  prepend_MANPATH ${1}/share/man
}

function prepend_bin_lib64()
{
  prepend_PATH ${1}/bin
  prepend_LD_LIBRARY_PATH ${1}/lib64
}

function prepend_p_l_m()
{
  prepend_PATH ${1}
  prepend_LD_LIBRARY_PATH ${2}
  prepend_MANPATH ${3}
}

function prepend_bin_lib_shareman()
{
  prepend_p_l_m ${1}/bin ${1}/lib ${1}/share/man
}

function prepend_bin_lib_man()
{
  prepend_p_l_m ${1}/bin ${1}/lib ${1}/man
}

function source_if_exist()
{
  if [[ -f ${1} ]]; then
    source "$@" &> /dev/null
  fi
}

function setup_osx()
{
  if command -v brew &> /dev/null; then
    prepend_PATH "$(brew --prefix coreutils)/libexec/gnubin"
  fi
}

########################## End of function definition #####################

EDITOR=vim
TERM="xterm-256color"
PAGER="less"
export INSTALL_ROOT=${HOME}/softs/install/

# sbin
prepend_PATH /usr/sbin/

# /sbin
prepend_PATH /sbin/

# /usr/local/bin
prepend_PATH /usr/local/bin

prepend_MANPATH /usr/local/man

# vim
prepend_bin_shareman ${INSTALL_ROOT}/vim

# madagascar
source_if_exist ${INSTALL_ROOT}/madagascar/share/madagascar/etc/env.sh

# python
prepend_bin_lib_shareman ${INSTALL_ROOT}/Python

# ruby
prepend_bin_lib_shareman ${INSTALL_ROOT}/ruby

# scons
prepend_bin_man ${INSTALL_ROOT}/scons

# CUDA
prepend_bin_lib64 ${INSTALL_ROOT}/cuda

# cwp_su
export CWPROOT=${INSTALL_ROOT}/cwp_su_all
prepend_PATH ${CWPROOT}/bin

# intel root directory
INTEL_ROOT=${INSTALL_ROOT}/intel
source_if_exist ${INTEL_ROOT}/composerxe/bin/compilervars.sh intel64
source_if_exist ${INTEL_ROOT}/impi/bin64/mpivars.sh
source_if_exist ${INTEL_ROOT}/vtune_amplifier_xe/amplxe-vars.sh quiet
source_if_exist ${INTEL_ROOT}/inspector_xe/inspxe-vars.sh quiet

# mpi
prepend_bin_lib_shareman ${INSTALL_ROOT}/mpi

# boost
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/boost/lib

# maxcompiler
source_if_exist ${INSTALL_ROOT}/maxcompiler/settings.sh

# texlive
TEXLIVE_ROOT=${INSTALL_ROOT}/texlive
prepend_PATH    ${TEXLIVE_ROOT}/bin/x86_64-linux
prepend_MANPATH ${TEXLIVE_ROOT}/texmf/doc/man

# opencv
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/opencv/lib

# git
prepend_bin_man ${INSTALL_ROOT}/git

prepend_bin_man ${INSTALL_ROOT}/valgrind

# cmake
prepend_PATH ${INSTALL_ROOT}/cmake/bin

# ~/softs/bin
prepend_PATH ${INSTALL_ROOT}/../bin

# autojump
prepend_PATH ${INSTALL_ROOT}/autojump/bin

# tmux
prepend_PATH ${INSTALL_ROOT}/tmux/bin

# gnuplot
prepend_bin_shareman ${INSTALL_ROOT}/gnuplot

# zsh
prepend_bin_lib_shareman ${INSTALL_ROOT}/zsh

# matlab2014b
prepend_PATH ${INSTALL_ROOT}/matlab/bin
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/runtime/glnxa64
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/bin/glnxa64
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/sys/os/glnxa64
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/matlab/sys/opengl/lib/glnxa64

# ${HOME}/.local/bin
prepend_PATH ${HOME}/.local/bin

# ${HOME}/.dotfile/bin
prepend_PATH ${HOME}/.dotfile/bin

setup_osx

# vim: ft=zsh
