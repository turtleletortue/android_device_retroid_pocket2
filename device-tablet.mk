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
    ro.sf.lcd_density=186

# Tablet characteristics
PRODUCT_CHARACTERISTICS := tablet

