EDITOR=vim
PAGER="less"

GREP_OPTIONS='--color=auto'
GREP_COLOR='3;33'

# python
PYTHON_ROOT=${HOME}/vroot/local/Python
export PATH=${PYTHON_ROOT}/bin:${PATH}
export LD_LIBRARY_PATH=${PYTHON_ROOT}/lib:${LD_LIBRARY_PATH}

# ruby
RUBY_ROOT=${HOME}/vroot/local/ruby
export PATH=${RUBY_ROOT}/bin:${PATH}
export LD_LIBRARY_PATH=${RUBY_ROOT}/lib:${LD_LIBRARY_PATH}

# scons
SCONS_ROOT=${HOME}/vroot/local/scons
export PATH=${SCONS_ROOT}/bin:${PATH}

# CUDA
CUDA_ROOT=${HOME}/vroot/local/cuda
export PATH=${CUDA_ROOT}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_ROOT}/lib64:${LD_LIBRARY_PATH}

# cwp_su
export CWPROOT=${HOME}/vroot/local/cwp_su_all
export PATH=${CWPROOT}/bin:${PATH}

# intel compiler toolkits
COMPOSERXE_ROOT=${HOME}/vroot/opt/composerxe
INTELCOMPILERVAR=${COMPOSERXE_ROOT}/bin/compilervars.sh
if [[ -f $INTELCOMPILERVAR ]]; then
  source $INTELCOMPILERVAR intel64
fi

# intel mpi
IMPI_ROOT=${HOME}/vroot/opt/impi
INTELMPIVAR=${IMPI_ROOT}/bin64/mpivars.sh
if [[ -f $INTELMPIVAR ]]; then
  source $INTELMPIVAR
fi

# mpich
MPI_ROOT=${HOME}/vroot/local/mpi
export PATH=${MPI_ROOT}/bin:${PATH}

# for madagascar
MADAGASCAR_ROOT=${HOME}/vroot/local/madagascar
MADAGASCARENV=${MADAGASCAR_ROOT}/share/madagascar/etc/env.sh
if [[ -f $MADAGASCARENV ]]; then
  source $MADAGASCARENV
fi

# boost
BOOST_ROOT=${HOME}/vroot/local/boost
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

# nodejs
NODEJS_ROOT=${HOME}/vroot/local/node
export PATH=${NODEJS_ROOT}/bin:${PATH}
export LD_LIBRARY_PATH=${NODEJS_ROOT}/lib:${LD_LIBRARY_PATH}

# preceed personal path before system path
# it is better placed at the last line
export PATH=${PATH}:/usr/sbin/
export PATH=$HOME/vroot/bin:${PATH}

# add manpath
export MANPATH=${HOME}/vroot/man/:$MANPATH
export MANPATH=${HOME}/vroot/share/man/:$MANPATH

# autojump
[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && \
  source ${HOME}/.autojump/etc/profile.d/autojump.sh

# vim: ft=zsh
