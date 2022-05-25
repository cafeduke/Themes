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

log "Install duke home bin"
mkdir ${HOME}/bin
cp bin/* ${HOME}/bin
chmod 755 ${HOME}/bin
log "Done"

if [[ ! -d "${HOME}/duke-git" ]]
then
  log "Install duke-git"
  wget https://github.com/cafeduke/duke-git/archive/master.zip -O duke-git.zip >& ${LOGFILE}
  unzip -q duke-git.zip -d $HOME >& ${LOGFILE}
  log "Done"
fi
