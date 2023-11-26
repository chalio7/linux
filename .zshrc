# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[white]%}%1~ %{$fg[red]%}❯%{$reset_color%} "



#history commands after closing
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


setopt AUTO_CD
stty stop undef		# Disable ctrl-s to freeze terminal.



# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

eval "$(zoxide init zsh)"

# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history


bindkey -s '^o' 'openAll\n'
bindkey -s '^F' 'openDir\n'
bindkey -s '^t' 'fcmd\n'
bindkey -s '^k' 'killProcess\n'
#alias kp='kill $(ps aux | fzf | awk "{print \$2}")'
#alias cdf='cd "$(find * -type d | fzf --preview="ls {}" --preview-window=right:70%:wrap)"'

#Edit command line wiht ctrl + e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete


#find lastest commands in history and exec
fcmd() {
    com=$( cat ~/.cache/zsh/history|fzf --tac )
    eval $com
}



# fkill - kill processes - list only the ones you can kill.
killProcess() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}


#Aliases
alias	cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"
alias phone="scrcpy"
alias mkdir="mkdir -pv"
alias p="sudo pacman"
alias note="nvim -m list"
#alias kp='kill $(ps aux | fzf | awk "{print \$2}")'
alias v="nvim"
alias V="sudo nvim"
alias ls="exa --group-directories-first --icons"
alias nm="nmtui"
alias pcs="pokemon-colorscripts"
alias mpv="mpv --fullscreen"
# alias led=""
alias trc="tremc -X"
alias lf="lfcd"
alias wally='python ~/scripts/ranwallet.py'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias sxiv="nsxiv"
alias nvpn="sudo nordvpn"
alias led="devour $HOME/programs/ledger/ledger-live-desktop-2.71.1-linux-x86_64.AppImage"
alias neo="neo  --color=green2 --shortpct=100 --speed=12 --async -d 1.5 --lingerms=1,1 --rippct=0 --maxdpc=1"



alias smi="sudo make clean install"
alias ytv="youtube-dl -i --add-metadata"
alias yta="youtube-dl -x -f bestaudio/best"

# Start graphical server on user's current tty if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

#task



#Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# ZVM_CURSOR_STYLE_ENABLED=false

# Suggest aliases for commands
ZSH_HIGHLIGHT_STYLES[path]='none'
