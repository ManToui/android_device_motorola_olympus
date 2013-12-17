USE_CAMERA_STUB := true
BOARD_USES_GENERIC_AUDIO := false

# inherit from the proprietary version
-include vendor/motorola/olympus/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := olympus
TARGET_BOARD_PLATFOR := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true

BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
TARGET_BOOTANIMATION_USE_RGB565 := true

# Kernel configuration for inline building
TARGET_KERNEL_CONFIG := tegra_olympus_defconfig
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

#storage
TARGET_NO_BOOT := false
TARGET_NO_RECOVERY := false
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_JANKY_BACKBUFFER := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8355840
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 407772160
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_VOLD_MAX_PARTITIONS := 19
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#UMS, MTP
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"

# WiFi
BOARD_WLAN_DEVICE := bcmdhd
ifeq ($(BOARD_WLAN_DEVICE),bcmdhd)
BOARD_LEGACY_NL80211_STA_EVENTS:=true
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/vendor/firmware/fw_bcmdhd.bin nvram_path=/system/etc/nvram.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/vendor/firmware/fw_bcmdhd_apsta.bin nvram_path=/system/etc/nvram.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"
endif
ifeq ($(BOARD_WLAN_DEVICE),bcm4329)
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/vendor/firmware/fw_bcm4329.bin nvram_path=/system/etc/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_SOCKET_IFACE    := eth0
endif

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/motorola/olympus/config/bluetooth/vnd_olympus.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/motorola/olympus/config/bluetooth
BOARD_BLUETOOTH_LIBBT_VNDCFG := device/motorola/olympus/config/bluetooth/bt_vendor.conf
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := true

#EGL
BOARD_EGL_CFG := device/motorola/olympus/config/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_GL_VENDOR_EXTENSIONS := true
BOARD_EGL_NEEDS_LEGACY_FB := true

BOARD_USE_MOTO_DOCK_HACK := true
BOARD_USES_AUDIO_LEGACY := true
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB -DMOTOROLA_UIDS -DICS_CAMERA_BLOB -DDISABLE_HW_ID_MATCH_CHECK
BOARD_CAMERA_HAVE_ISO := true
BOARD_MOBILEDATA_INTERFACE_NAME := "ppp0"
TARGET_SCREEN_WIDTH:=540
TARGET_SCREEN_HEIGHT:=960

#RECOVERY
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB := device/motorola/olympus/root/fstab.olympus
RECOVERY_FSTAB_VERSION := 2

SKIP_SET_METADATA := true

TARGET_RECOVERY_INITRC := device/motorola/olympus/init.recovery.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/olympus/recovery/recovery_ui.c

DEVICE_RESOLUTION:=540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true

SP1_NAME := "osh"
SP1_DISPLAY_NAME := "Webtop"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1

RECOVERY_SDCARD_ON_DATA := true 
#-- this enables proper handling of /data/media on devices that have this folder for storage (most Honeycomb and devices that originally shipped with ICS like Galaxy Nexus)
BOARD_HAS_NO_REAL_SDCARD := true 
#-- disables things like sdcard partitioning
TW_INCLUDE_DUMLOCK := true 
#-- includes HTC Dumlock for devices that need it
TARGET_RECOVERY_GUI := true 
#-- uses gui format instead of ui.xml
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565" 
#-- to change the colour
TW_CUSTOM_POWER_BUTTON := 107 
#-- to get a power button on the home screen of recovery

TW_INTERNAL_STORAGE_PATH := "/emmc"
TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"

TW_EXTERNAL_STORAGE_PATH := "/sdcard" 
#-- default external storage path
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard" 
#-- default external mount point
TW_FLASH_FROM_STORAGE := true 
#-- enables you to flash zips form the sdcard (You don't neeed o add this it is activated by default)
TW_HAS_DOWNLOAD_MODE := false 
#-- to enable download or more precisely enabling usb mass storage
TW_HAS_NO_RECOVERY_PARTITION := true 
#-- do this only if you device has no partion to recovery
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_JB_CRYPTO := false
TW_NEVER_UNMOUNT_SYSTEM := true 
#-- always keeps the system mounted
TW_NO_BATT_PERCENT := false 
#-- shows battery percentage
TW_NO_REBOOT_BOOTLOADER := true 
#-- disables rebooting into bootloader
TW_NO_USB_STORAGE := false 
#-- disabled usb storage
TW_SDEXT_NO_EXT4 := false
