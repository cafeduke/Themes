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
sudo sudo apt install gnome-tweak-tool -y >& ${LOGFILE}
log "Done"

# Install theme
# -------------

log "Install theme: DukeYaruDark.zip"
mkdir -p ${HOME}/.themes
unzip -q themes/DukeGlass-2.1.zip -d ${HOME}/.themes
log "Done"

log "Install icon-theme: Yaru-Blue"
mkdir -p ${HOME}/.icons
unzip -q icons/Yaru-Blue.zip -d ${HOME}/.icons
log "Done"

# Install cursor
# -------------

log "Install cursor: breeze-adapta"
curl --silent https://raw.githubusercontent.com/mustafaozhan/Breeze-Adapta-Cursor/master/install.sh | bash >& ${LOGFILE}
log "Done"

# Install wallpaper and login screen
# ----------------------------------

log "Install wallpaper and custom app icons"
mkdir -p ${HOME}/Pictures/WallPapers ${HOME}/Pictures/Icons
cp wallpapers/* ${HOME}/Pictures/WallPapers
cp custom-app-icons/* ${HOME}/Pictures/Icons
log "Done"

log "Install pre-requisite for login screen"
sudo apt update
sudo apt install libglib2.0-dev-bin -y

log "Set login screen background image"
sudo login-screen-bg/ubuntu-gdm-set-background --image ${HOME}/Pictures/WallPapers/UbuntuPurplePlain.png

log "Change wallpaper"
gsettings set org.gnome.desktop.background picture-uri file:///${HOME}/Pictures/WallPapers/ForestGreen01.jpg
