# Call Android TV packages
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Call device.mk (shared between CM/LineageOS & AOSP)
$(call inherit-product, device/retroid/pocket2/device.mk)

# Call Lineage TV configs
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

# Call Lineage ATV configs
$(call inherit-product, device/lineage/atv/lineage_atv.mk)

# Device branding for AOSP
PRODUCT_BRAND := google
PRODUCT_DEVICE := pocket2
PRODUCT_MANUFACTURER := retroid
PRODUCT_MODEL := Retroid Pocket 2
PRODUCT_NAME := lineage_atv_pocket2
PRODUCT_RELEASE_NAME := RetroidPocket2

# Lineage Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/lineage

# Remove extra apps
PRODUCT_PACKAGES += RemovePackages

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=140 \
    lineage.updater.uri=https://raw.githubusercontent.com/turtleletortue/OTA/15.1/15.1_atv_pocket2.json

# Tablet characteristics
PRODUCT_CHARACTERISTICS := tv

