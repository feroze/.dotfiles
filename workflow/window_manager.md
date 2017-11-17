Install i3-gaps, rofi, polybar

add fonts

add i3-gaps ubuntu repo for latest version
Add preview tools to ranger and nautilus to view files directly without clicking

for polybar to work, install fonts and enable bitmap

# "Un-disable" bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
# Clear the font cache
sudo fc-cache -f -v
