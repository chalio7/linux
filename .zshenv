#Default

PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/scripts:$HOME/scripts/statusbar:$HOME/.local/bin/ #:$HOME/Applications/
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export PATH
export SHELL="/bin/zsh"
export BAT_STYLE="header-filename,header-filesize,grid"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK_THEME="Orchis-Dark"
# export GTK_THEME="Orchis-Light"


export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
export TERMINAL="st"
export TERMINAL_PROG="st"
# export COLORTERM="truecolor"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"
export VIDEO="mpv"
export IMAGE="nsxiv"
export OPENER="xdg-open"
export FZF_DEFAULT_OPTS='--height 40% --preview-window=40% --reverse --color=16 --exact'
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
#. "$HOME/.cargo/env"

# Start graphical server on user's current tty if not already running.
# [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
