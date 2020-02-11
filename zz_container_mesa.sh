if [ "$(basename ${BASH_SOURCE} .sh)" != "zz_container_${CONTAINER_NAME}" ]; then
   return 0
fi

if [ -f ~/.jhbuildrc.mesa ]; then
	export JHBUILDRC=~/.jhbuildrc.mesa
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

# Disable Mesa GLSL cache
export MESA_GLSL_CACHE_DISABLE=true
export ANV_ENABLE_PIPELINE_CACHE=0

# Disable icecc
unset CCACHE_PREFIX

# Other envvars used
export INTEL_PRECISE_TRIG=1
export PIGLIT_DEQP_VK_BIN=~/vk-gl-cts/_build/external/vulkancts/modules/vulkan/deqp-vk
export DISPLAY=:0
export GLSLC=glslc
