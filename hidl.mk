# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Power (non-lineage imp)
#PRODUCT_PACKAGES += android.hardware.power@1.0-impl

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.renderscript@1.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service

# Gatekeeper HIDL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Bluetooth - Use mtk version instead
#PRODUCT_PACKAGES += \
#    android.hardware.bluetooth@1.0-impl \
#    android.hardware.bluetooth@1.0-service

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@2.0-impl \

#    android.hardware.audio@2.0-impl \
#    android.hardware.audio@2.0-service

# Keymaster HIDL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl 

# Lights - use mtk impl
#PRODUCT_PACKAGES += \
#    android.hardware.light@2.0-impl 

# Sensors - use mtk impl
#PRODUCT_PACKAGES += \
#    android.hardware.sensors@1.0-impl

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl 
#android.hardware.thermal@1.0-service

# Camera
#PRODUCT_PACKAGES += \
#    android.hardware.camera.provider@2.4-service \
#    android.hardware.camera.provider@2.4-impl

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

# wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-impl \
    android.hardware.wifi@1.0-service

# Broadcastradio
#PRODUCT_PACKAGES += \
#    android.hardware.broadcastradio@1.1-impl \
#    android.hardware.broadcastradio@1.1-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic \
    android.hardware.usb.gadget@1.0-impl \
    android.hardware.usb.gadget@1.0-service

