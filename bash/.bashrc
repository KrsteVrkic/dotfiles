export SUDO_EDITOR=emacs

#\u - user name
#\h - short hostname
#\W - current working dir
#\? - exit status of the command

#\e[ : Start color scheme.
#x;y : Color pair to use (x;y)
#$PS1 : Your shell prompt variable.
#\e[m : Stop color scheme.
#export PS1="\e[0;31m[\u@\h \W]\$ \e[m "

ASCII_DIR="$HOME/dotfiles/bash/ascii"

if [[ $- == *i* && -d "$ASCII_DIR" && "$TERM" != "linux" ]]; then
    find "$ASCII_DIR" -maxdepth 1 -type f -name '*.txt' |
        sort |
        shuf -n 1 |
        while IFS= read -r art; do
            lolcat -a -d 1 "$art"
            printf '\n'
        done
fi


alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[1;32m\][\u]\[\e[1;34m\][\W]\[\e[0m\]\$ '


