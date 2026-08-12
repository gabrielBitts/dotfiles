# Install necessary packages on my favourite distros
packages="eza emacs kitty rust cargo python3 openssl-devel alsa-lib-devel libdbus-devel"
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

echo "===== Copying files to the right place... ====="
echo "emacs/.emacs ~/"
echo "bash/.bashrc ~/"
echo "kitty/kitty.conf ~/.config/kitty/"
echo "wallpapers/* ~/Wallpapers"

mkdir ~/Wallpapers
cp -r wallpapers/* ~/Wallpapers
cp -r emacs/.emacs ~/
cp -r bash/.bashrc ~/
cp -r kitty/kitty.conf ~/.config/kitty/

