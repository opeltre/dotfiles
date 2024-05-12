# Editor
EDITOR=vim

nosleep () {
    systemd-inhibit --what=handle-lid-switch sleep $1
} 

#--- tree 

alias tree="tree --gitignore"

#--- vimgrep

function vimgrep () {
    echo $2
    vim $(grep -l $1 $2)
}

#--- disk usage -------

function disk-usage () {
    out="$HOME/.du/$(basename $(readlink -m $1))"
    du -h $1 | grep "^[0-9|,]*G" > $out
    echo "wrote output to $out"
    tail -n 1 $out
}

#--- tmux ----------

function tmux-fp () {

    SESSIONNAME="fp"

    tmux has-session -t $SESSIONNAME &> /dev/null

    if [ $? != 0 ] 
     then
        tmux new-session -s $SESSIONNAME -n fp -d
        tmux send-keys -t $SESSIONNAME "archey3" C-m 
    fi
    tmux attach -t $SESSIONNAME
}


#--- jqml ---------------------

export JULIA_LOAD_PATH=$HOME/jqml:$JULIA_LOAD_PATH


#--- python -------------------

# qml
export QML_DATADIR='/home/oli/qml_datasets'
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Datasets 
export TORCH_DSETS='/home/oli/vision-datasets'
export INFUSION_DATASETS='/home/oli/revert/datasets/icp'
export PCMRI_DATASETS='/home/oli/revert/datasets/pcmri'
export REVERT_LOGS='/home/oli/revert/runs/logs'
export REVERT_MODELS='/home/oli/revert/runs/models'

function pytest () {
    wd=$(pwd)
    if [ -d test ]; then
            cd test && python -m unittest
            cd $wd
    else
            echo "nothing to do"
    fi
}


#--- manjaro prompt ------------

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


#--- miniconda ---------------------------

#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

### >>> conda initialize >>>
### !! Contents within this block are managed by 'conda init' !!
#
#   __conda_setup="$('/home/oli/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#   if [ $? -eq 0 ]; then
#       eval "$__conda_setup"
#   else
#       if [ -f "/home/oli/miniforge3/etc/profile.d/conda.sh" ]; then
#           . "/home/oli/miniforge3/etc/profile.d/conda.sh"
#       else
#           export PATH="/home/oli/miniforge3/bin:$PATH"
#       fi
#   fi
#   unset __conda_setup
#
#   if [ -f "/home/oli/miniforge3/etc/profile.d/mamba.sh" ]; then
#       . "/home/oli/miniforge3/etc/profile.d/mamba.sh"
#   fi
#
### <<< conda initialize <<<
