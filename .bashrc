~/scripts/startup
#ps1 variable prompt
PS1="\e[0;34m\]\u@\h:\W\]\$ \[\e[0m\]"

#aliases for ls
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -la'

#aliases for cd
#alias cde='cd ~/'
#alias cds='cd ~/scripts'
#alias cdl='cd ~/labs'

#aliases for scripts 
alias logged='~/scripts/logged'
alias loggedin='~/scripts/loggedin'
alias check='~/scripts/check'
alias checksub='~/scripts/checksub'
alias backup='~/scripts/backup'
alias whois='~/scripts/whois'

#functions
function home(){
cur1=`pwd`
cd ~
ls
cur=`echo $cur1`
}

function cde(){
cur1=`pwd`
cd ~/
ls
cur=`echo $cur1`
}

function cdl(){
cur1=`pwd`
cd ~/labs
ls
cur=`echo $cur1`
}

function cds(){
cur1=`pwd`
cd ~/scripts
ls
cur=`echo $cur1`
}

function up(){
if [ $# -eq 1 ] ; then
    up=""
    cur=`pwd`
    val=$1
    while [ $val -gt 0 ] ; do
        up="$up../"
        let val=$[$val-1]
    done
    cd $up
else
    cd ../
fi
}

function back(){
cur1=`pwd`
cd $cur
cur=`echo $cur1`
}

function md(){
mkdir -p $1
cur1=`pwd`
cd $1
cur=`echo $cur1`
}

function reload(){
source .profile
}
ENV=~/.shrc

export ENV