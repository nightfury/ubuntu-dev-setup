#!/bin/bash
# Only bash has a syntax to declare array. 'sh' does not have 
# So if you use !/bin/sh in the first line the script would fail

declare -a tiplist=(
	'sudo apt-get --assume-yes install .. to intall packages without prompt'
	'apt list --installed #Gets you list of the install packages'
	'apt-cache search package-name  #Search list of available packages'
	"comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) #Gets list of manually installed packages"
	'apt-mark showmanual #List of manual packages' 	
	
);
#http://unix.stackexchange.com/questions/37411/multiline-shell-script-comments-how-does-this-work
: << 'be_aware_of_comments'
#This is an abuse of the null command ':' and the here-document syntax
#to achieve a "multi-line comment".  According to the POSIX spec linked 
#above, if any character in the delimiter word ("end_long_comment" in 
#this case) above is quoted, the here-document will not be expanded in 
#any way.  This is **critical**, as failing to quote the "end_long_comment" 
#will result in the problems with unintended expansions described above. 
#All of this text in this here-doc goes to the standard input of :, which 
#does nothing with it, hence the effect is like a comment.  There is very 
#little point to doing this besides throwing people off.  Just use '#'.

#echo ${tiplist[@]}  # Gets you all the elements in the array in one go
#echo ${#tiplist[@]} #Number of the elements in the array
#echo ${#tiplist[0]} #Lenght of first element
be_aware_of_comments

for tip in "${tiplist[@]}"
do
   echo " $tip"
done
