# Typora github theme customization

Copy the contents to typora themes folder

## If ~/.config/Typora exits
```bash
cp *.css $HOME/.config/Typora/themes
```

## If ~/snap/typora/*/.config/Typora/themes/
```bash
cp *.css $(ls -d -1 /home/raghu/snap/typora/*/.config/Typora/themes/ | head -1)
```
