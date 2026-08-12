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
git clone https://github.com/aome510/spotify-player
cd spotify_player
echo   "Installing spotify_player into the system"
cargo install spotify_player --locked
cd ..
sudo rm -rf spotify_player
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
sudo cp -rf Telegram/ /opt/telegram/
echo "================== Done :) ===================="
echo

