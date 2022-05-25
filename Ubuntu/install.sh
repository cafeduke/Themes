#!/bin/bash -e

# -------------------------------------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------------------------------------
BASEDIR=$(dirname $(readlink -f ${0}))
export THEMES_HOME=$(cd ${BASEDIR}/../ && pwd)
export LOGFILE="/tmp/install.log"
source ${THEMES_HOME}/common/util.sh
cd ${BASEDIR}

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

heading "Ubuntu customizations"

log "Install wget curl git"
sudo apt install wget curl git zsh -y >& ${LOGFILE}
log "Done"

# Install bin files
# -----------------
bash ${BASEDIR}/install-bin.sh

# Install Fonts
# -------------
log "Install fonts"
mkdir -p ${HOME}/.fonts
cp fonts/* ${HOME}/.fonts
fc-cache -f -v >& ${LOGFILE}
log "Done"

# Install theme
# -------------
bash ${BASEDIR}/install-theme.sh

