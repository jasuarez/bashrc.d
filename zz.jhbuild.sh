if [ -n "${BASH_SOURCE##*.${CONTAINER_NAME}.*}" ] ; then
   return 0
fi

export JHBUILDRC=~/.jhbuildrc.jhbuild
