function dieUsage {
  local mesg=${1}
  echo "Error: ${1}"
  usage
  exit 1
}

function die {
  local mesg=${1}
  echo "Error: ${1}"
  exit 1
}

function heading {
  local mesg=${1}
  echo "-------------------------------------------------------------------------------------------------"
  echo "${mesg}"
  echo "-------------------------------------------------------------------------------------------------"
}
