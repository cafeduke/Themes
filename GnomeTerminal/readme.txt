# Save current gnome settings
# ---------------------------
dconf dump /org/gnome/terminal/ > gnome_terminal_settings.txt

# Load gnome settings
# -------------------
dconf load /org/gnome/terminal/ < gnome_terminal_settings.txt
