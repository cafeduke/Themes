if [ ${#} -ne 2 ]
then
  echo "Usage: ${0} <theme name> <version>"
  exit 1
fi

# This is a comment
themeName="${1}"
version="${2}"

if [ ! -d "${HOME}/GitProjects/vscode-${themeName}-theme" ]
then
  echo "Clone git project : git clone https://github.com/cafeduke/vscode-${themeName}-theme.git $HOME/GitProjects/"
  exit 1
fi

cd $HOME/GitProjects/vscode-${themeName}-theme
vsce package -o $HOME/GitProjects/Themes/VSCode/build
code --install-extension $HOME/GitProjects/Themes/VSCode/build/${themeName}-${version}.vsix
