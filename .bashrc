# $FreeBSD: src/share/skel/dot.profile,v 1.23.2.1.2.1 2009/10/25 01:10:29 kensmith Exp $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# TERM=cons25; 	export TERM
TERM=xterm; 	export TERM

BLOCKSIZE=K;	export BLOCKSIZE
EDITOR=vim;   	export EDITOR
PAGER=less;  	export PAGER

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi

LC_ALL=zh_TW.UTF-8; export LC_ALL
LANG=zh_TW.UTF-8; export LANG
DIR=Dx
SYM_LINK=Gx
SOCKET=Fx
PIPE=dx
EXE=Cx
BLOCK_SP=Dx
CHAR_SP=Dx
EXE_SUID=hb
EXE_GUID=ad
DIR_STICKY=Ex
DIR_WO_STICKY=Ex
export LSCOLORS="$DIR$SYM_LINK$SOCKET$PIPE$EXE$BLOCK_SP$CHAR_SP$EXE_SUID$EXE_GUID$DIR_STICKY$DIR_WO_STICKY"

function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}") ";
}
PS1="\e[0;32m\]烏龜田\[\e[0;37m\]@\[\e[0;33m\]MacBook Pro\[\033[0m\] \[\e[0;32m\]\w\[\033[0m\] \[\033[0m\]\[\e[0;36m\]\$(git_branch)\[\033[0;33m\]\[\033[0m\]\n$ "
# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#source ~/.bashrc_citytalk
#source ~/.bashrc_alias
#source ~/.bashrc_personal
if [ -f ~/.bashrc_citytalk ]; then
    source ~/.bashrc_citytalk
fi

if [ -f ~/.bashrc_alias ]; then
    source ~/.bashrc_alias
fi

if [ -f ~/.bashrc_personal ]; then
    source ~/.bashrc_personal
fi

source /etc/bash_completion.d/git-completion.bash
