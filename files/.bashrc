alias e='~/Programs/ST3/sublime_text'

alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias l='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias rm='rm -v'           #  Show deleted files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias f='find -name'
alias cb='chromium-browser'
alias ydl='python ~/Programs/youtube-dl/youtube-dl'
alias ssh-ubuntu='ssh -l ubuntu'

alias clc='reset'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# remove trailing whitespace from files
alias trim="sed -i 's/[[:space:]]*$//' $@"

# shortcuts for cd
j() {
    $(python ~/.jump.py $@)
}

# For terminal title settings
PROMPT_COMMAND='echo -ne "\033]0;$(basename `pwd`)\007"'

# Set history size
export HISTSIZE=100000
export HISTCONTROL=erasedups
shopt -s histappend

# git niceness for command line
source ~/.git-completion.bash

# exit code, working dir, git stuff, $
PS1='\[\033[33m\]$? \[\033[1;34m\]\w \[\033[1;32m\]$(__git_ps1 "[%s] ")\[\033[0m\]\$ '

export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

