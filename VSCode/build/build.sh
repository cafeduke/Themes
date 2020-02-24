if [ ! -d "${HOME}/GitProjects/vscode-dukedark-theme" ]
then
   echo "Clone git project : git clone https://github.com/cafeduke/vscode-dukedark-theme.git $HOME/GitProjects/"
   exit 1
fi

cd $HOME/GitProjects/vscode-dukedark-theme
vsce package -o $HOME/GitProjects/Themes/VSCode/build
code --install-extension $HOME/GitProjects/Themes/VSCode/build/dukedark-0.0.2.vsix
