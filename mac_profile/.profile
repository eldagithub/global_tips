alias ll='ls -alrt'

alias ionos='ssh u96548946@access774016797.webspace-data.io'
alias mysqlstart='mysql.server start' 
alias mysqlstop='mysql.server stop' 
#alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop' 
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no '
alias gogit='cd /Users/elmos/OneDrive/TECH/github'
alias gitcom='git add .; git commit -m "${PWD##*/} at `date ` " '


#curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#source ~/git-completion.sh
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

#export PS1="\h:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1='\[\e[1;32m\]Hello \[\e[1;33m\]\W \[\e[1;34m\]$(__git_ps1) \[\e[1;35m\]$ \[\e[0m\]'
export PS1='\[\e[1;32m\]\W:\[\e[1;33m\]\[\e[1;34m\]$(__git_ps1)\[\e[1;35m\]$ \[\e[0m\]'
