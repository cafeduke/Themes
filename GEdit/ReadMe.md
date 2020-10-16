# Gnome Editor Themes

[Download](https://github.com/cafeduke/Themes/archive/master.zip), extract and `cd` to the extracted directory. All paths shall thus be relative to this directory.

## Setup themes from this project

```bash
> cp GEdit/*.xml $HOME/.local/share/gedit/styles/
```

## Setup language themes from this project

### Find directories having language specification

Each of the directories listed in below shall have a corresponding `<language>.lang` file. For example, shell script language specification file is `sh.lang`

```bash
> ls -d /usr/share/gtksourceview-*/language-specs
/usr/share/gtksourceview-3.0/language-specs
/usr/share/gtksourceview-4/language-specs
```

### Copy language customization

Copy text.lang to each directory listed above.

```bash
> sudo cp GEdit/text.lang /usr/share/gtksourceview-3.0/language-specs
> sudo cp GEdit/text.lang /usr/share/gtksourceview-4/language-specs
```

