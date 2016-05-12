if [ "$(basename ${BASH_SOURCE} .sh)" != "${SCHROOT_CHROOT_NAME}" ]; then
   return 0
fi

export JHBUILDRC=~/.jhbuildrc.mesa
