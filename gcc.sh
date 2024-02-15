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

# Set first icecc
if [ ${iceccdir} ]; then
    export PATH=${PATH//:${iceccdir}:/:}
    export PATH=${PATH//:${iceccdir}/}
    export PATH=${PATH//${iceccdir}:/}
    export PATH=${iceccdir}:${PATH}
fi

# Now set ccache before icecc
if [ ${ccachedir} ]; then
    export PATH=${PATH//:${ccachedir}:/:}
    export PATH=${PATH//:${ccachedir}/}
    export PATH=${PATH//${ccachedir}:/}
    export PATH=${ccachedir}:${PATH}
    export CCACHE_COMPRESS=1
    export CCACHE_UMASK=002
fi
