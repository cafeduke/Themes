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
# Main
# -------------------------------------------------------------------------------------------------

heading "Ubuntu customizations"

log "Install wget curl git"
sudo apt install wget curl git zsh -y >& ${LOGFILE}
log "Done"

# Home binary files
# -----------------

log "Install bin"
unzip -o -q data/bin.zip -d ${HOME}
log "Done"

if [[ ! -d "${HOME}/duke-git" ]]
then
  log "Install duke-git"
  wget https://github.com/cafeduke/duke-git/archive/master.zip -O duke-git.zip >& ${LOGFILE}
  unzip -o -q duke-git.zip -d $HOME >& ${LOGFILE}
  mv $HOME/duke-git-master $HOME/duke-git
  log "Done"
fi

# Install home dot files (HOME/.<dir>)
# ------------------------------------
log "Install hidden home files"
unzip -o -q data/dot.zip -d ${HOME}
log "Done"

for x in fonts icons themes ssh gnupg local config
do
  log "Install .${x}"
  unzip -o -q data/dot_${x}.zip -d ${HOME}
  log "Done"
done

# Install Pictures
# ----------------
log "Install Pictures"
unzip -o -q data/Pictures.zip -d ${HOME}
log "Done"


# Install theme
# -------------
bash ${BASEDIR}/install-theme.sh

# Install locale
# --------------
sudo cp ${BASEDIR}/locale /etc/default/locale

# Workaround: Ensure login screen on external monitor
# ---------------------------------------------------
# https://askubuntu.com/questions/1043337/is-there-to-make-the-login-screen-appear-on-the-external-display-in-18-04
sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml
sudo chown gdm:gdm ~gdm/.config/monitors.xml

# Install extensions
# ------------------
# Applications Menu
# Arc Menu
# Burn My Windows
# Just Perfection
# Lock Keys
# No overview on start-up
# Unite
# User Themes
log "Extracting: ${BASEDIR}/extensions/extensions.zip to ${HOME}/.local/share/gnome-shell"
unzip -o -q ${BASEDIR}/extensions/extensions.zip -d ${HOME}/.local/share/gnome-shell

# Install software: mcfly
#   - Ctrl-r shall provide the history for searching and executing command
curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh -o install_mcfly.sh
chmod 755 install_mcfly.sh
sudo ./install_mcfly.sh -s -- --git cantino/mcfly

