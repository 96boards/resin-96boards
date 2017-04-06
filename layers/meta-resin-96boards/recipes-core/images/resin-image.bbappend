IMAGE_FSTYPES_append_hikey = " resinos-img"
IMAGE_FSTYPES_append_hikey960 = " resinos-img"

RESIN_IMAGE_BOOTLOADER_hikey = "grub"
RESIN_BOOT_PARTITION_FILES_hikey = " \
    grubaa64.efi:/EFI/BOOT/BOOTAA64.EFI \
    ${KERNEL_IMAGETYPE}-${MACHINE}.bin:/boot/${KERNEL_IMAGETYPE} \
    ${KERNEL_IMAGETYPE}-hi6220-hikey.dtb:/boot/hi6220-hikey.dtb \
"
