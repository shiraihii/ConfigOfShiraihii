# Created by newuser for 5.0.5
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias vi='vim'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# set english when login with tty
if [ -z "$DISPLAY" ]; then
	export LANG=en_US.UTF-8
	export LANGUAGE=en_US
else
	export LANG=zh_CN.UTF-8
	export LANGUAGE=zh_CN
fi
export EDITOR="vim"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
autoload -U promptinit
promptinit
prompt clint 
autoload -U colors && colors
#export PS1="%B%n@%~ %b"
export PS1="%F{red}<%F{green}%B%n%b@%F{cyan}%m%F{white}:%F{yellow}%~%F{red}>
%(2L.%B%h%b%(?..[%?%1v] )%(2v.%U%B%F{yellow}%2v%f%b%u.)%f %B%F{Blue}$%f%b "
