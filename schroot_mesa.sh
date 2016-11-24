if [ "$(basename ${BASH_SOURCE} .sh)" != "schroot_${SCHROOT_CHROOT_NAME}" ]; then
   return 0
fi

export JHBUILDRC=~/.jhbuildrc.mesa

if [ -f /opt/gnome/install/share/vulkan/icd.d/intel_icd.x86_64.json ]; then
	export VK_ICD_FILENAMES=/opt/gnome/install/share/vulkan/icd.d/intel_icd.x86_64.json
fi
