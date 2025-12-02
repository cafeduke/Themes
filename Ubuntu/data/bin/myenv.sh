#!/bin/bash
if [[ ! "$PWD" =~ ${HOME}/Oracle/Products/OHS/.*/src ]]
then
  echo "Could not determine test root from $PWD"
  exit 1
fi

TEST_ROOT=$(echo $PWD | sed "s%/src/.*%/src%")

echo "Sourcing ${TEST_ROOT}/apache/scripts/env.sh"
source ${TEST_ROOT}/apache/scripts/env.sh
