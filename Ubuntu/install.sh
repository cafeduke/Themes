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

# Install Locale
# --------------
sudo cp ${BASEDIR}/locale /etc/default/locale 

# Install Extensions
# ------------------
# Applications Menu
# Arc Menu
# Burn My Windows
# Just Perfection
# Lock Keys
# No overview on start-up
# Unite
# User Themes
log "Extracting: ${BASEDIR}/exensions/extensions.zip to ${HOME}/.local/share/gnome-shell"
unzip -q ${BASEDIR}/exensions/extensions.zip -d ${HOME}/.local/share/gnome-shell

# Install software: mcfly 
#   - Ctrl-r shall provide the history for searching and executing command
curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh -o install.sh
chmod 755 install.sh
bash install.sh -s -- --git cantino/mcfly

