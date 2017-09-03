if [ -d ${HOME}/.guix-profile ]; then
    export PATH=${HOME}/.guix-profile/bin:${HOME}/.guix-profile/sbin${PATH:+:}${PATH}
fi

if [ -d ${HOME}/.guix-profile/share/guile ]; then
    export GUILE_LOAD_PATH=${HOME}/.guix-profile/share/guile/site/2.2:${GUILE_LOAD_PATH}
    export GUILE_LOAD_COMPILED_PATH=${HOME}/.guix-profile/lib/guile/2.2/site-ccache:${GUILE_LOAD_COMPILED_PATH}
fi
