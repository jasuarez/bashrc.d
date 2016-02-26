if [ "$(basename ${BASH_SOURCE} .sh)" != "${SCHROOT_CHROOT_NAME}" ]; then
   return 0
fi

export M_USE_SOFTWARE_RENDERING=1
export SBOX_REDIRECT_IGNORE=/usr/bin/gdb
if [ -n "${SBOX_UNAME_MACHINE}" ]; then
	export PS1='\[\033[01;37m\](sbox\[\033[00;32m\]#$(/scratchbox/tools/bin/sb-conf current))\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[31m\]$(parse_git_branch)\[\033[00;34m\]\w\[\033[00m\]\$ '
	export DISPLAY=:2
fi
export DEB_BUILD_OPTIONS="debug noopt nocheck"
