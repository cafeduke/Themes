# -------------------------------------------------------------------------------------------------
# Environment variables
# -------------------------------------------------------------------------------------------------
BASEDIR=$(dirname $(readlink -f ${0}))
export THEMES_HOME=$(cd ${BASEDIR}/../ && pwd)

# -------------------------------------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------------------------------------

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

##
# Check if a given program is installed
##
function isInstalled {
  installCount=$(apt list --installed ${@} 2> /dev/null | grep installed | wc -l)
  if [[ ${installCount} -eq ${#} ]]
  then
    return 0
  else
    return 1
  fi
}

function isInstalledSnap {
  installCount=$(snap list ${@} 2> /dev/null | grep -v Name | wc -l)
  if [[ ${installCount} -eq ${#} ]]
  then
    return 0
  else
    return 1
  fi  
}

# Print message and exit
function die {
  local mesg=${1}
  echo "Error: ${mesg}"
  exit 1
}
