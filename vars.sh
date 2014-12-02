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
    source "$@"
  fi
}

########################## End of function definition #####################

EDITOR=vim
TERM="xterm-256color"
PAGER="less"
export INSTALL_ROOT=${HOME}/softs/install/

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
source_if_exist ${INTEL_ROOT}/vtune_amplifier_xe/amplxe-vars.sh &> /dev/null

# mpi
prepend_bin_shareman ${INSTALL_ROOT}/mpi

# boost
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/boost

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

# cmake
prepend_PATH ${INSTALL_ROOT}/cmake/bin

# ~/softs/bin
prepend_PATH ${INSTALL_ROOT}/../bin

# sbin
prepend_PATH /usr/sbin/

# autojump
[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && \
  source ${HOME}/.autojump/etc/profile.d/autojump.sh

# vim: ft=zsh
