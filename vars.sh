EDITOR=vim
PAGER="less"

GREP_OPTIONS='--color=auto'
GREP_COLOR='3;33'

# for python
PYTHONROOT=${HOME}/vroot/local/Python
export PATH=${PYTHONROOT}/bin:${PATH}
export LD_LIBRARY_PATH=${PYTHONROOT}/lib:${LD_LIBRARY_PATH}

# CUDA
CUDAROOT=${HOME}/vroot/local/cuda
export PATH=${CUDAROOT}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDAROOT}/lib64:${LD_LIBRARY_PATH}

# cwp_su
export CWPROOT=${HOME}/vroot/src/cwp_su_all
export PATH=${CWPROOT}/bin:${PATH}

# intel compiler toolkits
ICCROOT=${HOME}/vroot/opt/composerxe
INTELCOMPILERVAR=${ICCROOT}/bin/compilervars.sh
if [[ -f $INTELCOMPILERVAR ]]; then
  source $INTELCOMPILERVAR intel64
fi

# intel mpi
IMPIROOT=${HOME}/vroot/opt/impi
INTELMPIVAR=${IMPIROOT}/bin64/mpivars.sh
if [[ -f $INTELMPIVAR ]]; then
  source $INTELMPIVAR
fi

# for madagascar
MADAGASCARROOT=${HOME}/vroot/local/madagascar
MADAGASCARENV=${MADAGASCARROOT}/share/madagascar/etc/env.sh
if [[ -f $MADAGASCARENV ]]; then
  source $MADAGASCARENV
fi

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
