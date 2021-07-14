# Call AOSP packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Add all product locales
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Vendor
$(call inherit-product-if-exists, vendor/retroid/pocket2/pocket2-vendor.mk)

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx

# Lights
PRODUCT_PACKAGES += lights.mt6580

# Audio
PRODUCT_PACKAGES += \
    audio.primary.mt6580 \
    audio_policy.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# Bluetooth
PRODUCT_PACKAGES += libbt-vendor

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/rootdir,root)

# Shims
PRODUCT_PACKAGES += \
    liblog_mtk

# Shims
PRODUCT_PACKAGES += \
    libmtk_symbols \
    libshim_ui \
    libshim_wvm \
    libshim_drm \
    libshim_bionic \
    libshim_netutils \
    libshim_camera

# MiraVision
PRODUCT_PACKAGES += \
    MiraVision

# Graphics
PRODUCT_PACKAGES += \
    libGLES_android \
    libion

# OTA Update Setup
#PRODUCT_PROPERTY_OVERRIDES += \
#    cm.updater.uri=https://raw.githubusercontent.com/turtleletortue/lineage_ota/cm-14.1/lineageos_pocket2.json

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.config.low_ram=true \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Tablet characteristics
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
