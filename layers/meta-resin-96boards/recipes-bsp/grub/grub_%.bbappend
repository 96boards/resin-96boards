FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://cfg.in_resin-os"

inherit image_types_resin

do_deploy_prepend() {
    # Using our built-in cfg file provided via this recipe
    sed -e "s|@RESIN_ROOTA_FS_LABEL|${RESIN_ROOTA_FS_LABEL}|" \
        < ../cfg.in_resin-os \
        > ../cfg.sdcard
}
