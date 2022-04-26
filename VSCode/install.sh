#!/bin/bash
BASEDIR=$(dirname $(readlink -f ${0}))
export THEMES_HOME=$(cd ${BASEDIR}/../ && pwd)
source ${THEMES_HOME}/common/util.sh
cd ${BASEDIR}

# -------------------------------------------------------------------------------------------------
# sudo
# -------------------------------------------------------------------------------------------------

# Install vscode as sudo if not already installed
isInstalledSnap code
if [[ $? -eq 0 ]]
then
  log "VSCode already installed"
else
  if [[ $(id -u) -ne 0 ]]
  then
    echo "Note: Run as sudo first for installing vscode. Later run as regular user"
    exit 1
  fi
  log "Install code"
  snap install --classic code
  log "Done"
  exit 0
fi

# -------------------------------------------------------------------------------------------------
# Regular user
# -------------------------------------------------------------------------------------------------
# Install extensions as user
heading "Install/Upgrade extensions"
code --install-extension cafeduke.dukedark --force
code --install-extension emmanuelbeziat.vscode-great-icons --force
code --install-extension formulahendry.auto-rename-tag --force
code --install-extension redhat.vscode-xml --force
code --install-extension redlin.remove-tabs-on-save --force
code --install-extension shardulm94.trailing-spaces --force

# Update settings
heading "Update settings.json"
cp settings.json ~/.config/Code/User/settings.json
