#!/bin/bash
# -------------------------------------------------------------------------------------------------
# Function
# -------------------------------------------------------------------------------------------------
function exec {
  echo "Executing: ${@}"
  eval "${@}"
}

echo ""
echo "Install theme"
mkdir -p $HOME/.local/share/gedit/styles/
exec cp "*.xml" "$HOME/.local/share/gedit/styles/"

echo ""
echo "[GEdit] Install language spec"
for x in $(ls -d /usr/share/gtksourceview-*/language-specs)
do
  exec sudo cp "*.lang" $x
done
