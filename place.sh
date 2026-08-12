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

