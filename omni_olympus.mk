## Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/gsm.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

LOCAL_PATH := device/motorola/olympus

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/root/init.target.usb.rc:root/init.target.usb.rc \
    $(LOCAL_PATH)/root/ueventd.olympus.rc:root/ueventd.olympus.rc \
    $(LOCAL_PATH)/root/fstab.olympus:root/fstab.olympus \
    $(LOCAL_PATH)/root/file_contexts:root/file_contexts

# motorola helper scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/scripts/pds_perm_fix.sh:system/bin/pds_perm_fix.sh

# sysctl conf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/sysctl.conf:system/etc/sysctl.conf \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf

# Set en_US as default locale
PRODUCT_LOCALES := zh_CN

# olympus uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# not exactly xhdpi, but we have enough RAM, why not use it?
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/motorola/olympus/olympus-vendor.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

#fs tools
PRODUCT_PACKAGES += make_ext4fs \
			e2fsck \
 			setup_fs

#bluetooth
PRODUCT_PACKAGES += l2ping \
			hciconfig \
			hcitool \
			libnetcmdiface

#Audio
PRODUCT_PACKAGES += DockAudio \
			audio.usb.default \
			audio.a2dp.default

#Camera and lights
PRODUCT_PACKAGES += Torch \
			camerawrapper \
			camera.tegra \
			lights.olympus

PRODUCT_PACKAGES += com.android.future.usb.accessory \
			mot_boot_mode \
			OlympusParts

#wlan firmware
PRODUCT_PACKAGES += \
	fw_bcmdhd.bin \
	fw_bcmdhd_apsta.bin \
	fw_bcmdhd_p2p.bin

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/scripts/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    $(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/config/touchpad.cfg:system/etc/touchpad/22/touchpad.cfg \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

#keyboard files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    $(LOCAL_PATH)/keychars/tegra-kbc.kcm.bin:system/usr/keychars/tegra-kbc.kcm.bin \
    $(LOCAL_PATH)/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/keylayout/qwerty.kl:system/usr/keylayout/BTC_USB_Cordless_Mouse.kl \
    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keylayout/qtouch-obp-ts.kl:system/usr/keylayout/qtouch-obp-ts.kl \
    $(LOCAL_PATH)/config/qtouch-obp-ts.idc:system/usr/idc/qtouch-obp-ts.idc \
    $(LOCAL_PATH)/keylayout/Motorola_Mobility_Motorola_HD_Dock.kl:system/usr/keylayout/Motorola_Mobility_Motorola_HD_Dock.kl \
    $(LOCAL_PATH)/keylayout/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    $(LOCAL_PATH)/keylayout/evfwd.kl:system/usr/keylayout/evfwd.kl \
    $(LOCAL_PATH)/keychars/evfwd.kcm.bin:system/usr/keychars/evfwd.kcm.bin \
    $(LOCAL_PATH)/keylayout/usb_keyboard_102_en_us.kl:system/usr/keylayout/usb_keyboard_102_en_us.kl \
    $(LOCAL_PATH)/keychars/usb_keyboard_102_en_us.kcm.bin:system/usr/keychars/usb_keyboard_102_en_us.kcm.bin \
    $(LOCAL_PATH)/keylayout/usb_keyboard_102_en_us.kl:system/usr/keylayout/Motorola_Bluetooth_Wireless_Keyboard.kl \
    $(LOCAL_PATH)/keychars/usb_keyboard_102_en_us.kcm.bin:system/usr/keychars/Motorola_Bluetooth_Wireless_Keyboard.kcm.bin

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

#RIL
PRODUCT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libmoto_ril.so \
	persist.ril.mux.noofchannels=9 \
	persist.ril.mux.ttydevice=/dev/ttyHS3 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=500 \
	persist.ril.modem.ttydevice=/dev/ttySPI0 \
	persist.ril.modem.mode=2 \
	persist.ril.features=0x2020 \
	persist.ril.mux.retries=500 \
	persist.ril.mux.sleep=2 \
	ro.kernel.android.ril=yes \
	persist.ril.pppd.start.fail.max=16 \
	mobiledata.interfaces=ppp0 \
	ro.telephony.ril.v3=signalstrength,skipbrokendatacall,writeaidonly

# Default network type.
# 0 -> WCDMA preferred
# 3 -> GSM Auto(PRL)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=3

#wifi
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.supplicant_scan_interval=30 \
	wifi.interface=wlan0

#bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/pds/bt/bt_bdaddr


PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	persist.sys.ui.hw=true \
	ro.sf.lcd_density=240

# Forbid format of these partitions in mount menu :
PRODUCT_PROPERTY_OVERRIDES += \
	ro.cwm.forbid_format=/misc,/radio,/pds,/bootloader,/recovery,/efs

# Default USB Mode
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
	ro.authentec.fingerprint.jar=/system/framework/am2app.jar
	ro.authentec.fingerprint.so=/system/lib/libam2app.so

# 1% battery
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.use_charge_counter=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := omni_olympus
PRODUCT_DEVICE := olympus
PRODUCT_MODEL := MB860
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola

## Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_BRAND=MOTO PRODUCT_NAME=olyatt BUILD_PRODUCT=olyatt BUILD_FINGERPRINT=MOTO/olyatt/olympus:2.3.4/4.5.91/110625:user/release-keys PRIVATE_BUILD_DESC="olympus-user 2.3.4 4.5.91 110625 release-keys"
