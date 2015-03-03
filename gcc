unset CC
unset CXX
unset CCACHE_PREFIX
unset CCACHE_DISABLE
unset CCACHE_DIR

# Check if ccache is available
if [ -d /usr/lib64/ccache ]; then
    ccachedir=/usr/lib64/ccache
fi

if [ -d /usr/lib/ccache ]; then
    ccachedir=/usr/lib/ccache
fi

# Check if icecream is available
if [ -d /usr/libexec/icecc/bin ]; then
    iceccdir=/usr/libexec/icecc/bin
fi

if [ -d /usr/lib/icecc/bin ]; then
    iceccdir=/usr/lib/icecc/bin
fi

# Reset ccache / icecream from PATH. We want to setup ourselves
if [ ${ccachedir} ]; then
    export PATH=${PATH//:${ccachedir}:/:}
    export PATH=${PATH//:${ccachedir}/}
    export PATH=${PATH//${ccachedir}:/}
fi

if [ ${iceccdir} ]; then
    export PATH=${PATH//:${iceccdir}:/:}
    export PATH=${PATH//:${iceccdir}/}
    export PATH=${PATH//${iceccdir}:/}
fi

# Setup paths
if [ ${ccachedir} ]; then
    export PATH=${ccachedir}:${PATH}
	 export CCACHE_COMPRESS=1
	 export CCACHE_UMASK=002
    if [ -d /opt/ccache/cache ]; then
	     export CCACHE_DIR=/opt/ccache/cache
    fi
    if [ ${iceccdir} ]; then
             export CCACHE_PREFIX=icecc
    fi
elif [ ${iceccdir} ]; then
    export PATH=${iceccdir}:${PATH}
fi
