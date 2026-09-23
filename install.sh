# Install necessary packages on my favourite distros
packages="eza emacs kitty rust cargo python3 openssl-devel alsa-lib-devel dbus-devel adwaita-fonts-all.noarch adwaita-mono-fonts.noarch yt-dlp"
file="/etc/os-release"

if [ -f "$file" ]
then
    echo "$file found."
    . $file

    echo "Distro ID =" $ID
    if [ "$ID" = "fedora" ]
    then
	sudo dnf install -y $packages
    elif [ "$ID" = "debian" ] || [ "$ID" = "mint" ]
    then
	sudo apt get $packages
    fi
else
    echo "$file not found."
fi

# Install terminal based spotify, pretty neat project!
echo
echo "============= Installing Spotify =============="
echo     "Cloning and navigating to repo"
wget https://github.com/LargeModGames/spotatui/releases/latest/download/spotatui-linux-x86_64.tar.gz
sudo tar -xvf spotatui-linux-x86_64.tar.gz
sudo mkdir -p /opt/spotatui
sudo cp -rf spotatui /opt/spotatui/
sudo chmod +x /opt/spotatui/
sudo rm -rf spotify_player-x86_64-unknown-linux-gnu.tar.gz spotatui
echo     "Creating Spotatui desktop link"
cat <<EOF > ~/.local/share/applications/spotatui.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Spotaiu
Exec=/opt/spotaui/spotaui
Terminal=true
EOF
chmod +x ~/.local/share/applications/spotatui.desktop
echo "================== Done :) ===================="
echo

# Install ZapFast!
echo
echo "============= Installing ZapFast =============="
echo     "Cloning and navigating to repo"
wget https://github.com/crmne/zapfast/releases/latest/download/zapfast-v0.14.0-x86_64-unknown-linux-gnu.tar.gz
sudo tar -xvf zapfast-v0.14.0-x86_64-unknown-linux-gnu.tar.gz
sudo mkdir -p /opt/zapfast
sudo cp -rf zapfast-v0.14.0-x86_64-unknown-linux-gnu/zapfast /opt/zapfast/
sudo chmod +x /opt/zapfast
sudo rm -rf zapfast-*
echo     "Creating ZapFast desktop link"
cat <<EOF > ~/.local/share/applications/zapfast.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=ZapFast
Exec=/opt/zapfast/zapfast
Terminal=false
EOF
chmod +x ~/.local/share/applications/zapfast.desktop
echo "================== Done :) ===================="
echo

# Install Librewolf
echo
echo "============ Installing Librewolf ============="
sudo dnf config-manager addrepo \
     --from-repofile=https://repo.librewolf.net/librewolf.repo
sudo dnf install librewolf
echo "================== Done :) ===================="
echo

# Install Telegram
echo
echo "============= Installing Telegram ============="
wget https://telegram.org/dl/desktop/linux
sudo tar -xvf linux
sudo cp -rf Telegram/* /opt/telegram/
rm -rf Telegram linux
echo     "Creating Telegram desktop link"
cat <<EOF > ~/.local/share/applications/telegram.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Telegram
Exec=/opt/telegram/Telegram
Terminal=false
EOF
chmod +x ~/.local/share/applications/telegram.desktop
echo "================== Done :) ===================="
echo
