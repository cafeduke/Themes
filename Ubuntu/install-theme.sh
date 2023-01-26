#!/bin/bash -e

# -------------------------------------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------------------------------------
BASEDIR=$(dirname $(readlink -f ${0}))
export THEMES_HOME=$(cd ${BASEDIR}/../ && pwd)
source ${THEMES_HOME}/common/util.sh
cd ${BASEDIR}

# -------------------------------------------------------------------------------------------------
# Main
# -------------------------------------------------------------------------------------------------

# Pre-requisite: Install tweak tool
# ---------------------------------
log "Install Gnome tweak tool"
sudo apt install gnome-tweaks chrome-gnome-shell -y >& ${LOGFILE}
log "Done"

# Install cursor
# -------------
log "Install cursor: breeze-adapta"
curl --silent https://raw.githubusercontent.com/mustafaozhan/Breeze-Adapta-Cursor/master/install.sh | bash >& ${LOGFILE}
log "Done"

# Install wallpaper and login screen
# ----------------------------------
log "Install pre-requisite for login screen"
sudo apt update
sudo apt install libglib2.0-dev-bin -y

log "Set login screen background image"
sudo login-screen-bg/ubuntu-gdm-set-background --image ${HOME}/Pictures/WallPapers/UbuntuPurplePlain.png

log "Change wallpaper"
gsettings set org.gnome.desktop.background picture-uri file:///${HOME}/Pictures/WallPapers/ForestGreen01.jpg
