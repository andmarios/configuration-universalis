case $TERM in
	xterm*|rxvt|Eterm|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

# activate bash-completion: (Gentoo specific)
[ -f /etc/profile.d/bash-completion.sh ] && source /etc/profile.d/bash-completion.sh

export PS1="\[\033[1;31m\]\u\[\033[1;33m\]@\[\033[1;34m\]\h \[\033[1;36m\]\W\[\033[1;0m\] $ "

# commands starting with space should be recorded to history! Nice for passwords.
# Also ignore duplicate entries
export HISTCONTROL=ignorespace:ignoredups
export HISTSIZE=10000

# Go path
export PATH="${PATH}:/home/mrsaccess/go/bin"
export GOPATH=/home/mrsaccess/go

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glnc="git log --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit"

pythonserver()
{
    python -m SimpleHTTPServer $1 || python -m http.server $1
}
