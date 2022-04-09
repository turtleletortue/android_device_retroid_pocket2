# Android Go defaults
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)

# Launched with 8.1
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Add all product locales
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Vendor
$(call inherit-product-if-exists, vendor/retroid/pocket2/pocket2-vendor.mk)

# Turtle extras
$(call inherit-product-if-exists, vendor/turtle/extras/turtle-vendor.mk)

# Hidl
include $(LOCAL_PATH)/hidl.mk

# Include vendor properties
include $(LOCAL_PATH)/vendor_prop.mk

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx

# Audio
PRODUCT_PACKAGES += \
    audio.primary.mt6580 \
    audio_policy.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    libaudioroute \
    libtinyalsa \
    libalsautils \
    libtinycompress \
    libtinyxml \
    tinymix \
    tinypcminfo \
    tinycap \
    tinyplay

# Bluetooth
PRODUCT_PACKAGES += libbt-vendor

# etc
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    librs_jni \
    libnl_2

# Init files
PRODUCT_PACKAGES += \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6580.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    multi_init.rc \
    fstab.mt6580 \
    ueventd.mt6580.rc \
    init.mt6580.usb.rc \
    init.nvdata.rc \
    fstab.enableswap

# Graphics
PRODUCT_PACKAGES += \
    libGLES_android \
    libion

# Retroid Apps
PRODUCT_PACKAGES += \
    Toolbox \
    RsMappingLite

# VNDK-SP
PRODUCT_PACKAGES += \
    vndk-sp

PRODUCT_PACKAGES += \
    libnbaio_mono

# DRM
PRODUCT_PACKAGES += \
    libdrm \
    libmockdrmcryptoplugin 

# Shims
PRODUCT_PACKAGES += \
    libshim_graphic_buffer \
    libshim_mtkomx \
    libshim_kpoc

# Other libraries
PRODUCT_PACKAGES += \
    libunwindstack \
    libdexfile

# Default default.prop properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.config.low_ram=true \
    ro.mount.fs=EXT4 \
    persist.service.acm.enable=0 \
    ro.hwui.disable_asset_atlas=true \
    ro.mtk_perf_fast_start_win=0 \
    persist.service.acm.enable=0 \
    debug.atrace.tags.enableflags=0 \
    ro.hwui.path_cache_size=0 \
    ro.hwui.text_small_cache_width=512 \
    ro.hwui.text_small_cache_height=256 \
    camera.disable_zsl_mode=1

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

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy \

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/aosp

# MTKRC
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mtkrc.path=/vendor/etc/init/hw/

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
