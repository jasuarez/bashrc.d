# Vim is the default editor
export VISUAL=vim

# Chromium development
if [ -x /usr/local/sbin/chrome-devel-sandbox ]; then
	export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox
fi

# Cargo binaries
if [ -d ${HOME}/.cargo/bin ]; then
	PATH=${HOME}/.cargo/bin:${PATH}
fi

# Set PATH so it includes user's private bin
if [ -d ${HOME}/bin ]; then
	PATH=${HOME}/bin:${PATH}
fi

if [ -d ${HOME}/.local/bin ]; then
	PATH=${HOME}/.local/bin:${PATH}
fi

# Ccache
if [ -d /opt/ccache/cache ]; then
	export CCACHE_DIR=/opt/ccache/cache
fi

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox
if [ -d /opt/vm/vagrant.d ]; then
	export VAGRANT_HOME=/opt/vm/vagrant.d
fi

# Makeflags
export MAKEFLAGS="-j$(nproc)"

# Container
if [ -n "$DOCKER_NAME" ]; then
	export CONTAINER_NAME=$DOCKER_NAME
fi

if [ -n "$SCHROOT_CHROOT_NAME" ]; then
	export CONTAINER_NAME=$SCHROOT_CHROOT_NAME
fi

if [ -f "/run/.containerenv" ]; then
	export CONTAINER_NAME=`cat /run/.containerenv | grep name | cut -f2 -d\"`
fi
