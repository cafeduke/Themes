#!/bin/bash -e
BASEDIR=$(dirname $(readlink -f ${0}))
BASENAME=$(basename ${0})
THEMEDIR=$(readlink -f ${BASEDIR}/../)

echo "Generating DukeGlassNavy.gresource"
gresource-create gresource DukeGlassNavy

echo "Updating DukeGlassNavy.gresource"
cp DukeGlassNavy.gresource ${THEMEDIR}/gtk-3.0/gtk.gresource
ls -l DukeGlassNavy.gresource ${THEMEDIR}/gtk-3.0/gtk.gresource

