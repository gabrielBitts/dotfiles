#
# ~/.bashrc
#

# afetch run on terminal open
fastfetch

# Local user and git status on terminal
source /usr/share/git-core/contrib/completion/git-prompt.sh
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

# Custom aliases
alias ls='eza -l --color=auto --icons=always'
alias grep='grep --color=auto'
alias update='sudo dnf update -y'
alias install='sudo dnf install -y'
alias remove='sudo dnf uninstall'
alias cv_heic=' for f in *.[hH][eE][iI][cC]; do heif-convert "$f" "${f%.*}.jpg"; done'
alias spotify='/opt/spotify_player/spotify_player'
alias mount_server='sudo mount -t cifs //$SV_ADDRESS/Server /mnt/server_nattz   -o username=$SV_U,password=$SV_P,uid=$(id -u),gid=$(id -g),iocharset=utf8'
