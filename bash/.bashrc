#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) ||
    eval $(dircolors -b)

# Activate bash-autocomplete
source /usr/share/bash-completion/bash_completion
shopt -s direxpand

export REPOS=~/Desktop/repositories

export HOSTALIASES=~/.hosts
set -o vi

# Aliases
alias dirs='dirs -v'
alias up='cd ..'
alias hgrep='history | grep -i'
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias ll='ls -lF --color=auto'
alias lla='ls -lFa --color=auto'
function cdl { cd $1; ll;}
alias todo='vim ~/Dropbox/TODO-list.txt'
alias activate-coupling='source /home/eduardo/.myscripts/activate-coupling.sh'
PS1='[\u@\h \W]\$ '

# MPI implementations
PATH=/opt/mpich3.2-gcc8.1.0/bin:$PATH
# PATH=/opt/openmpi2.0.4-gcc8.2.1/bin:$PATH
# PATH=/opt/openmpi4.0.1-gcc8.2.1/bin:$PATH

PATH=/home/eduardo/Android/Sdk/platform-tools:$PATH
PATH=/home/eduardo/Desktop/android-studio/bin:$PATH
PATH=/home/eduardo/Desktop/repositories/lammps-stable/src:$PATH
export CPL_PATH=/home/eduardo/Desktop/repositories/cpl-library
source $CPL_PATH/SOURCEME.sh

# export PATH=~/Desktop/repositories/packmol:$PATH
export PATH=/home/eduardo/.mydata/bin:$PATH

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$HOME/.gem

# added by Miniconda3 installer
# export PATH="/home/eduardo/miniconda3/bin:$PATH"

# added by Miniconda2 installer. Conda autoupdate turned off with
# conda config --set auto_update_conda False
export PATH="/home/eduardo/miniconda2/bin:$PATH"
#
export PYTHONPATH=/home/eduardo/Desktop/repositories/cplutils_env/cplutils:$PYTHONPATH
export PHD_RESULTS=/home/eduardo/Desktop/repositories/phd-results
export PATH=/home/eduardo/Desktop/repositories/phd-simulation-templates/properties/bin:$PATH
export PATH=/home/eduardo/Desktop/repositories/phd-simulation-templates/coupled/bin:$PATH

# Miniconda2
# export PATH=/home/eduardo/miniconda2-cpl/bin:$PATH
# export PATH=/home/eduardo/Desktop/repositories/BP-project-demo/framework-demo/coupled-framework-templates/coupling/bin:$PATH
# export PATH=/home/eduardo/Desktop/repositories/BP-project-demo/framework-demo/coupled-framework-templates/properties/bin:$PATH
