# Call AOSP packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Call device.mk (shared between CM/LineageOS & AOSP)
$(call inherit-product, device/retroid/pocket2/device.mk)

# Call device-tablet.mk (Used for non-ATV builds)
$(call inherit-product, device/retroid/pocket2/device-tablet.mk)

# Turtle extras
$(call inherit-product-if-exists, vendor/turtle/pocket2.mk)

# Call tablet config
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Device branding for AOSP
PRODUCT_BRAND := google
PRODUCT_DEVICE := pocket2
PRODUCT_MANUFACTURER := retroid
PRODUCT_MODEL := Retroid Pocket 2
PRODUCT_NAME := lineage_pocket2
PRODUCT_RELEASE_NAME := RetroidPocket2

# Lineage Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/lineage

# Remove extra apps
PRODUCT_PACKAGES += RemovePackages

