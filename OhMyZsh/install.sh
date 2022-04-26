#!/bin/bash -e

BASEDIR=$(dirname $(readlink -f ${0}))
export THEMES_HOME=$(cd ${BASEDIR}/../ && pwd)
source ${THEMES_HOME}/common/util.sh

# -------------------------------------------------------------------------------------------------
# sudo
# -------------------------------------------------------------------------------------------------
heading "Prompt customization: Oh-My-Zsh theme powerlevel10k" | tee install.log

isInstalled wget curl git zsh
if [[ $? -eq 0 ]]
then
  log "Programs 'wget curl git zsh' already installed"
else
  if [[ $(id -u) -ne 0 ]]
  then
    echo "Dependent programs among  'wget curl git zsh' not installed."
    echo "Note: Run as sudo first for installing dependencies. Later run as regular user"
    exit 1
  fi
  log "Install wget curl git zsh"
  apt install wget curl git zsh -y >& install.log
  log "Done"
  exit 0
fi

# -------------------------------------------------------------------------------------------------
# Regular user
# -------------------------------------------------------------------------------------------------
if [[ $(id -u) -eq 0 ]]
then
  die "sudo access not required. Run as regular user"
fi

# Install oh-my-zsh
log "Install oh-my-zsh"
if [ -e ${HOME}/.oh-my-zsh ]
then
  log "[WARNING] Dir ${HOME}/.oh-my-zsh. Skipping oh-my-zsh install"
else
  echo "Y" > yes.txt
  sh -c "$(echo 'Y' | curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" < yes.txt >& install.log
fi
log "Done"

# Install and setup link for powerlevel10k in $ZSH_CUSTOM/themes
log "Install powerlevel10k"
if [[ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]]
then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k >& install.log
  ln -s ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/
fi
cp .profile .zshrc .p10k.zsh ${HOME}
log "Done"

exec zsh
