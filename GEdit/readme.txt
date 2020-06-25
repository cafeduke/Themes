# GEdit Themes
# ------------
cp *.xml $HOME/.local/share/gedit/styles/

# GEdit language style for .txt files
# ------------------------------------
# See all target location using `find /usr/share -name sh.lang`
sudo cp lang.txt /usr/share/gtksourceview-3.0/language-specs/text.lang
sudo cp lang.txt /usr/share/gtksourceview-4/language-specs/text.lang
