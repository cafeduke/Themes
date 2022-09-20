# -------------------------------------------------------------------------------------------------
# Environment variables
# -------------------------------------------------------------------------------------------------

# Note: The BASEDIR and BASENAME will be of the file that is sourcing util.sh
BASEDIR=$(dirname $(readlink -f ${0}))
BASENAME=$(basename ${0} | sed -re "s%(.*)\..*%\1%")

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

# Print message and exit
function die {
  local mesg=${1}
  echo "Error: ${mesg}"
  exit 1
}

function dieUsage {
  local mesg=${1}
  echo "Error: ${1}"
  usage
  exit 1
}


