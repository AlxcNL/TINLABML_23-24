# Author: J.A.Boogaard@hr.nl
me=$(whoami)
if [[ "$me" == "abc" ]]; 
then
    sudo su - $(id -un 1002)    
fi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi