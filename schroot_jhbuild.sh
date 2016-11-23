if [ "$(basename ${BASH_SOURCE} .sh)" != "schroot_${SCHROOT_CHROOT_NAME}" ]; then
   return 0
fi

export JHBUILDRC=~/.jhbuildrc.jhbuild
