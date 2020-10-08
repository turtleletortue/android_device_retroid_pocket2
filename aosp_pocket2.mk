# Call device.mk (shared between CM/LineageOS & AOSP)
$(call inherit-product, device/retroid/pocket2/device.mk)

# Device branding for AOSP
PRODUCT_BRAND := google
PRODUCT_DEVICE := pocket2
PRODUCT_MANUFACTURER := retroid
PRODUCT_MODEL := Retroid Pocket 2
PRODUCT_NAME := aosp_pocket2
PRODUCT_RELEASE_NAME := RetroidPocket2

