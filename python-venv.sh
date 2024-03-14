VENV=${HOME}/.local/venv
PYTHON=python3

# Create Python venv
if [ ! -d ${VENV} ] &&
       $(command -v ${PYTHON} >/dev/null 2>&1) ; then
    echo "Creating ${PYTHON} venv..."
    ${PYTHON} -m venv ${VENV}
fi

# Enable Python venv
if [ -d ${VENV} ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=0
    source ${VENV}/bin/activate
fi
