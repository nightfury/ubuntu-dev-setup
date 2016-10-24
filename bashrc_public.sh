# --------------- Set the prompt --------------- 
RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
WHITE="\[\033[37;1m\]"
UCOLOR="\[\033[33m\]"
BLACK="\[\033[0m\]"
GREEN="\[\[\033[32m\]"
PINK="\[\033[m\]\[\[\033[35m\]"

#Smiley / Frowny
SMILEY="${GREEN} :)"
FROWNY="${RED} :("
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

PS1="[${UCOLOR}\u${NORMAL}@${GREEN}\h ${PINK}\W\`${SELECT}\`${NORMAL}]\$"
HISTCONTROL=ignoredups:ignorespace #Avoid duplicate lines in history
shopt -s histappend #Appedn to History
HISTSIZE=1000       #History Lenght
HISTFILESIZE=2000   #History Size

shopt -s checkwinsize #check and set the window size after each command

#-------------------
# standard aliases...
#-------------------
alias rm='rm -i'
alias ls='ls --color'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'
alias vi='/usr/bin/vim'
alias xcode='source ~/dev-setup/code_public.sh $@'
alias diskspace="du -S | sort -n -r |more"
alias cdDev='cd ~/dev-setup/'
alias edbp='vim ~/dev-setup/bashrc_public.sh'
alias edcp='vim ~/dev-setup/code_public.sh'

xtips() {
    if [ -f ~/dev-setup/tips_public.sh ]; then
        ~/dev-setup/tips_public.sh
    fi 
}

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


function xplore()
{
    find . -name *.c -o -name *.h > cscope.files
    cscope -R -b -i cscope.files
}
function cplink()
{
    file=$1
    tmp=`mktemp`
    cp -Lv $file $tmp
    mv -v $tmp $file
}

#Following section goes to tips.sh
# To delete two lines from the pattern
#sed -e '/{pattern}/,+2d' source_file > dest_file

#split file based on pattern
#csplit --prefix=tmp --digits=2 CSCuw99121.diff /^Index:/ {*} -q
#csplit --prefix=tmp -b "%03d.diff" 466.diff /^Index:/ {*} -q
#egrep -w --color \(CAP_C_NETSTACK_LEGACY\) routing-sw/routing/am/am.c | egrep -w --color SUP_NUOVA

#egrep -w --color \(CAP_C_NETSTACK_LEGACY\) f*.diff | egrep -w --color SUP_NUOVA | awk -F":" '{print $1};' | sort -u | xargs grep ^Index: | awk -F" " '{print $2};' > list
# egrep -w --coloegrep -w --color \(CAP_C_NETSTACK_LEGACY\) f*.diff | egrep -w --color SUP_NUOVA | grep '||'

#Split files
# cat 418.diff | awk -v "RS=Index:" 'NR > 1 { print RS $0 > "temp" (NR-1); close("temp" (NR-1)) }'
# http://stackoverflow.com/questions/8061475/split-one-file-into-multiple-files-based-on-pattern


