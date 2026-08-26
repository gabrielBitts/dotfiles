echo "=========== Extracting KDE configs ============"
python3 -m venv konsave
source konsave/bin/activate
pip install konsave
konsave -i kde/KDE.knsv
konsave -a KDE
deactivate
sudo rm -rf konsave
echo "=================== Done ======================"

echo "===== Copying files to the right place... ====="
echo "emacs/.emacs ~/"
echo "bash/.bashrc ~/"
echo "kitty/kitty.conf ~/.config/kitty/"
echo "wallpapers/* ~/Wallpapers"

mkdir -p ~/Wallpapers
cp -r wallpapers/* ~/Wallpapers
cp -r emacs/.emacs ~/
cp -r bash/.bashrc ~/
cp -r kitty/kitty.conf ~/.config/kitty/
echo "=================== Done ======================"
