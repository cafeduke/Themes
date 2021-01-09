#!/bin/bash -e

# -------------------------------------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------------------------------------
BASEDIR=$(dirname $(readlink -f ${0}))
cd ${BASEDIR}

##
# Display as heading
#
# Arguments:
#   mesg - Messages to be displayed
##
function heading {
  echo ""
  echo "---------------------------------------------------------------------------------------------------"
  for mesg in "$@"
  do
    echo "${mesg}"
  done  
  echo "---------------------------------------------------------------------------------------------------"
}

##
# Function executed before exit. Check if everything went fine. If not mention the logs.
##
function handleExit () {
  local status=${?}
  if [[ ${status} -ne 0 ]]
  then
    echo "[ERROR] See ${BASEDIR}/install.log for details."
    return ${status}
  fi
  return 0
}
trap handleExit EXIT

function log {
  local mesg=${1}
  echo "["$(date)"] ${mesg}" | tee -a install.log
}

# -------------------------------------------------------------------------------------------------
# Pre-requisite check
# -------------------------------------------------------------------------------------------------
if [[ $(id -u) -ne 0 ]]
then
  echo "Run with sudo access"
  exit 1
fi

# -------------------------------------------------------------------------------------------------
# Main
# -------------------------------------------------------------------------------------------------
heading "Prompt customization: Oh-My-Zsh theme powerlevel10k" | tee install.log

# Install zsh
log "Install wget curl git zsh"
apt install wget curl git zsh -y >& install.log
log "Done"

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
