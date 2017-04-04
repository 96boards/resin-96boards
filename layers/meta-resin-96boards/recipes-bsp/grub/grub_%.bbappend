FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://cfg.in_resin-os"

inherit image_types_resin

do_deploy() {
    sed -e "s|@RESIN_ROOTA_FS_LABEL|${RESIN_ROOTA_FS_LABEL}|" \
        < ../cfg.in_resin-os \
        > ../cfg_resin-os

    # Search for the grub.cfg on the local boot media by using the
    # built in cfg file provided via this recipe
    if [ "${GRUBPLATFORM}" = "efi" ] ; then
        grub-mkimage \
            -c ../cfg_resin-os \
            -p /EFI/BOOT \
            -d ./grub-core/ \
            -O ${GRUB_TARGET}-efi \
            -o ./${GRUB_IMAGE} \
            ${GRUB_BUILDIN}
        install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
    fi
}
