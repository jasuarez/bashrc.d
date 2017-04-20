# Vim is the default editor
export VISUAL=vim

# Chromium development
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

# Set PATH so it includes user's private bin
if [ -d ${HOME}/bin ]; then
	PATH=${HOME}/bin:${PATH}
fi

if [ -d ${HOME}/.local/bin ]; then
	PATH=${HOME}/.local/bin:${PATH}
fi

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox
if [ -d /opt/vm/vagrant.d ]; then
	export VAGRANT_HOME=/opt/vm/vagrant.d
fi

# Guix
if [ -d ${HOME}/.guix-profile ]; then
    PATH=${HOME}/.guix-profile/bin:${PATH}
fi
