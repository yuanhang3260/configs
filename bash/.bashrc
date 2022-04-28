#!bin\sh
#PS1='${USER}@`hostname -s` (\w)\n>>'

if ${use_color} ; then
        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi

        if [[ ${EUID} == 0 ]] ; then
                PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\]\n>>'
        else
                PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]\n>>'
        fi

        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we don't have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \w \$ '
        fi
fi

if [ -f "$HOME/.bash_ps1" ]; then
. "$HOME/.bash_ps1"
fi

alias ld='ls -F -l'
alias ll='ls -l -F'
alias home='cd ~'
alias q='exit'

export HISTCONTROL=ignoreboth:erasedups

export JAVA_HOME="/usr/share/jdk"
export PATH="$HOME/gradle/bin:$JAVA_HOME/bin:/$HOME/hadoop/bin:$PATH"

