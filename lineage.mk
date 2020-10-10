# Call device.mk (shared between CM/LineageOS & AOSP)
$(call inherit-product, device/retroid/pocket2/device.mk)

# Call tablet config
$(call inherit-product, vendor/cm/config/common_mini_tablet_wifionly.mk)

# Device branding for AOSP
PRODUCT_BRAND := google
PRODUCT_DEVICE := pocket2
PRODUCT_MANUFACTURER := retroid
PRODUCT_MODEL := Retroid Pocket 2
PRODUCT_NAME := lineage_pocket2
PRODUCT_RELEASE_NAME := RetroidPocket2

# Remove extra apps
PRODUCT_PACKAGES += RemovePackages
