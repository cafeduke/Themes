#!/bin/bash
BASEDIR=$(dirname $(readlink -f ${0}))
BASENAME=$(basename ${0})

echo "Installing terminator theme"
mkdir -p ${HOME}/.config/terminator
cp ${BASEDIR}/config ${HOME}/.config/terminator/
