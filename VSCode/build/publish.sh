#!/bin/bash
if [[ $# -ne 2 ]]
then
  echo "Usage: "$(basename ${0})" <theme-name> <version>"
  exit 1
fi
vsce publish -p dv656hhqzotmb4brb33kod5zpczl4cwlx6w43vpiuoipmzripnla --packagePath ${1}-${2}.vsix
