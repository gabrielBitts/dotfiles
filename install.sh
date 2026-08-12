# Install necessary packages on my favourite distros
packages="eza emacs kitty rust cargo python3 openssl-devel alsa-lib-devel dbus-devel"
file="/etc/os-release"

if [ -f "$file" ]
then
    echo "$file found."
    . $file

    echo "Distro ID =" $ID
    if [ "$ID" = "fedora" ]
    then
	sudo dnf install -y $packages
    elif [ "$ID" = "arch" ] ||  [ "$ID" = "cachyos" ]
    then
	sudo pacman -S $packages	
    elif [ "$ID" = "debian" ]
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
wget https://github.com/aome510/spotify-player/releases/latest/download/spotify_player-x86_64-unknown-linux-gnu.tar.gz
sudo tar -xvf spotify_player-x86_64-unknown-linux-gnu.tar.gz
sudo mkdir /opt/spotify_player
sudo cp -rf spotify_player /opt/spotify_player
rm -rf spotify_player-x86_64-unknown-linux-gnu.tar.gz spotify_player
echo "================== Done :) ===================="
echo

# Install waterfox
echo
echo "============= Installing Waterfox ============="
sudo dnf config-manager addrepo \
  --from-repofile=https://download.opensuse.org/repositories/isv:/BrowserWorks/Fedora_44/isv:BrowserWorks.repo
sudo dnf install waterfox
echo "================== Done :) ===================="
echo

# Install Telegram
echo
echo "============= Installing Telegram ============="
wget https://telegram.org/dl/desktop/linux
sudo tar -xvf linux
sudo cp -rf Telegram/* /opt/telegram/
rm -rf Telegram linux
echo "================== Done :) ===================="
echo

