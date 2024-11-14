if [ -n "${BASH_SOURCE##*.${CONTAINER_NAME}.*}" ] ; then
   return 0
fi

if [ -f ~/.jhbuildrc.mesa ]; then
	export JHBUILDRC=~/.jhbuildrc.mesa
fi

# Install python virtual env
VENV=/opt/mesa/pip
PYTHON=python3

# Create Python venv
if [ ! -d ${VENV} ] &&
       $(command -v ${PYTHON} >/dev/null 2>&1) &&
       $(${PYTHON} -c "import venv" >/dev/null 2>&1) ; then
    echo "Creating ${PYTHON} venv..."
    ${PYTHON} -m venv ${VENV}
fi

# Enable Python venv
if [ -d ${VENV} ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=0
    source ${VENV}/bin/activate
fi

# Vulkan ICD profiles
unset VK_ICD_FILENAMES

if [ -f /opt/gnome/install/share/vulkan/icd.d/intel_icd.x86_64.json ]; then
	export VK_ICD_FILENAMES=/opt/gnome/install/share/vulkan/icd.d/intel_icd.x86_64.json:$VK_ICD_FILENAMES
fi

if [ -f /home/igalia/jasuarez/jhbuild/install/share/vulkan/icd.d/intel_icd.x86_64.json ]; then
	export VK_ICD_FILENAMES=/home/igalia/jasuarez/jhbuild/install/share/vulkan/icd.d/intel_icd.x86_64.json:$VK_ICD_FILENAMES
fi

if [ -f /opt/jhbuild/install/share/vulkan/icd.d/intel_icd.x86_64.json ]; then
	export VK_ICD_FILENAMES=/opt/jhbuild/install/share/vulkan/icd.d/intel_icd.x86_64.json:$VK_ICD_FILENAMES
fi

# if [ -f /opt/gnome/install/share/vulkan/icd.d/radeon_icd.x86_64.json ]; then
#         export VK_ICD_FILENAMES=/opt/gnome/install/share/vulkan/icd.d/radeon_icd.x86_64.json:$VK_ICD_FILENAMES
# fi

# if [ -f /home/igalia/jasuarez/jhbuild/install/share/vulkan/icd.d/radeon_icd.x86_64.json ]; then
#         export VK_ICD_FILENAMES=/home/igalia/jasuarez/jhbuild/install/share/vulkan/icd.d/radeon_icd.x86_64.json:$VK_ICD_FILENAMES
# fi

# if [ -f /etc/vulkan/icd.d/amd_icd64.json ]; then
#         export VK_ICD_FILENAMES=/etc/vulkan/icd.d/amd_icd64.json:$VK_ICD_FILENAMES
# fi

# Enable bash completion
if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# Disable Mesa GLSL cache
export MESA_SHADER_CACHE_DISABLE=true

# Disable (per driver) Vulkan pipeline cache
#export ANV_ENABLE_PIPELINE_CACHE=0
export V3DV_ENABLE_PIPELINE_CACHE=off

# Disable threaded context
export GALLIUM_THREAD=false

# Disable icecc
unset CCACHE_PREFIX

# Other envvars used
export INTEL_PRECISE_TRIG=1
export PIGLIT_DEQP_VK_BIN=~/vk-gl-cts/_build/external/vulkancts/modules/vulkan/deqp-vk
export DISPLAY=:0
export GLSLC=glslc
export MESA_LOADER_DRIVER_OVERRIDE=v3d
export PIGLIT_PLATFORM=x11_egl

# Host-apps to use
alias emacs='/usr/libexec/flatpak-xdg-utils/flatpak-spawn --host emacs'
alias meld='/usr/libexec/flatpak-xdg-utils/flatpak-spawn --host meld'
