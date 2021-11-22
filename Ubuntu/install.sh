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

heading "Ubuntu customizations"

log "Install wget curl git"
apt install wget curl git zsh -y >& install.log
log "Done"

log "Install fonts"
mkdir -p ${HOME}/.fonts
cp fonts/* ${HOME}/.fonts
fc-cache -f -v >& install.log
log "Done"

log "Install duke home bin"
mkdir ${HOME}/bin
cp bin/* ${HOME}/bin
chmod 755 ${HOME}/bin
log "Done"

log "Install duke-git"
wget https://github.com/cafeduke/duke-git/archive/master.zip -O duke-git.zip >& install.log
unzip -q duke-git.zip -d $HOME >& install.log
log "Done"

log "Install Gnome tweak tool"
sudo apt install gnome-tweak-tool -y >& install.log
log "Done"

log "Install theme: DukeGlass-2.1.zip"
mkdir -p ${HOME}/.themes
unzip -q themes/DukeGlass-2.1.zip -d ${HOME}/.themes
log "Done"

log "Install icon-theme: Yaru-Blue"
mkdir -p ${HOME}/.icons
unzip -q icons/Yaru-Blue.zip -d ${HOME}/.icons
log "Done"

log "Install cursor: breeze-adapta"
curl --silent https://raw.githubusercontent.com/mustafaozhan/Breeze-Adapta-Cursor/master/install.sh | bash >& install.log
log "Done"

log "Install wallpaper and custom app icons"
mkdir -p ${HOME}/Pictures/WallPapers ${HOME}/Pictures/Icons
cp wallpapers/* ${HOME}/Pictures/WallPapers
cp custom-app-icons/* ${HOME}/Pictures/Icons
log "Done"

log "Set login screen background image"
sudo login-screen-bg/ubuntu-gdm-set-background --image ${HOME}/Pictures/WallPapers/UbuntuPurplePlain.png

log "Change wallpaper"
gsettings set org.gnome.desktop.background picture-uri file:///${HOME}/Pictures/WallPapers/ForestGreen01.jpg

