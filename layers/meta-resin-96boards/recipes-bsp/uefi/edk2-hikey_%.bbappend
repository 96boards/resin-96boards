FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://grub.cfg.in_resin-os"

inherit image_types_resin

do_install_append() {
    bbplain "INFO: Overwriting BSP grub configuration"
    sed -e "s|@DISTRO|${DISTRO}|" \
        -e "s|@DISTRO_VERSION|${DISTRO_VERSION}|" \
        -e "s|@RESIN_BOOT_FS_LABEL|${RESIN_BOOT_FS_LABEL}|" \
        -e "s|@KERNEL_IMAGETYPE|${KERNEL_IMAGETYPE}|" \
        -e "s|@CMDLINE|${CMDLINE}|" \
        < ${WORKDIR}/grub.cfg.in_resin-os \
        > ${WORKDIR}/grub.cfg
    install -D -p -m0644 ${WORKDIR}/grub.cfg ${D}/boot/grub/grub.cfg
}
