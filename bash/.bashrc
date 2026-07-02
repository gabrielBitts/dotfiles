#
# ~/.bashrc
#

# afetch run on terminal open
afetch

# Local user and git status on terminal
source /usr/share/git-core/contrib/completion/git-prompt.sh
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

# Custom aliases
alias ls='eza -l --color=auto --icons=always'
alias grep='grep --color=auto'
alias update='sudo dnf update -y'
alias install='sudo dnf install -y'
alias remove='sudo dnf uninstall'
