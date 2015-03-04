# Vim is the default editor
export VISUAL=vim

# Chromium development
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

# Set PATH so it includes user's private bin
if [ -d ${HOME}/bin ]; then
	PATH=${HOME}/bin:${PATH}
fi
