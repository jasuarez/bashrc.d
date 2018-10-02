if [ "$(basename ${BASH_SOURCE} .sh)" != "schroot_${SCHROOT_CHROOT_NAME}" ]; then
   return 0
fi

if [ -f ~/.jhbuildrc.mesa ]; then
	export JHBUILDRC=~/.jhbuildrc.mesa
fi

export LLVM_CONFIG=llvm-config-5.0

if [ -f /opt/gnome/install/share/vulkan/icd.d/intel_icd.x86_64.json ]; then
	export VK_ICD_FILENAMES=/opt/gnome/install/share/vulkan/icd.d/intel_icd.x86_64.json
elif [ -f /home/igalia/jasuarez/jhbuild/install/share/vulkan/icd.d/intel_icd.x86_64.json ]; then
	export VK_ICD_FILENAMES=/home/igalia/jasuarez/jhbuild/install/share/vulkan/icd.d/intel_icd.x86_64.json
fi

# Disable Mesa GLSL cache
export MESA_GLSL_CACHE_DISABLE=true
export ANV_ENABLE_PIPELINE_CACHE=0
