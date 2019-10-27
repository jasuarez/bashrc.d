if [ "$(basename ${BASH_SOURCE} .sh)" != "zz_container_${CONTAINER_NAME}" ]; then
   return 0
fi

export JHBUILDRC=~/.jhbuildrc.jhbuild
