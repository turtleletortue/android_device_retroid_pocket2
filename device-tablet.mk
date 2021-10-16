# Android stock launcher
PRODUCT_PACKAGES += \
    Launcher3Go

# RePoLa (community, open source launcher)
PRODUCT_PACKAGES += \
    RePoLa

# LeanbackIME (Android TV keyboard, from Android 11)
PRODUCT_PACKAGES += \
    LeanbackIME

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=186 \
    lineage.updater.uri=https://raw.githubusercontent.com/turtleletortue/OTA/15.1/15.1_pocket2.json
