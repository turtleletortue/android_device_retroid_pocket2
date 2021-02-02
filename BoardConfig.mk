# Get proprietary blobs
-include vendor/retroid/pocket2/BoardConfigVendor.mk

DEVICE_PATH := device/retroid/pocket2

# Architecture
TARGET_BOARD_PLATFORM := mt6580

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

# Screen
TARGET_SCREEN_HEIGHT := 640
TARGET_SCREEN_WIDTH := 480

# Kernel
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/retroid/pocket2
TARGET_KERNEL_CONFIG := gbx2000v1_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-eabi/bin/arm-eabi-
BOARD_MKBOOTIMG_ARGS := --pagesize 2048 --base 0x80000000 --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --second_offset 0x00f00000 --tags_offset 0x0e000000 --cmdline "bootopt=64S3,32S1,32S1 androidboot.selinux=permissive"

# Images
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1400831000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5259657216
BOARD_VENDORIMAGE_PARTITION_SIZE := 196607000
BOARD_FLASH_BLOCK_SIZE := 131072

# Build Vendor Image
TARGET_COPY_OUT_VENDOR := vendor
BOARD_USES_VENDORIMAGE := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# EGL
USE_OPENGL_RENDERER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := false
TARGET_USES_HWC2 := true
TARGET_USES_HWC2ON1ADAPTER := false
MTK_HWC_VERSION := 2.0.0
MTK_SF_USE_PROCESSCALLSTACK := true
MTK_GPU_VERSION := mali utgard r8p0-00dev0
MTK_HWC_SUPPORT := yes

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

# Charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Recovery resources
TARGET_RECOVERY_FSTAB := device/retroid/pocket2/rootdir/etc/recovery.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := device/retroid/pocket2/kernel

# Sepolicy
# N/A
BOARD_SEPOLICY_DIRS := \
    device/retroid/pocket2/sepolicy

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/retroid/pocket2/bluetooth

# Bootanimation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Shims
#TARGET_LDPRELOAD += libmtk_symbols.so

# SHims
#TARGET_LD_SHIM_LIBS := \
#    /system/bin/program_binary_service|libshim_program_binary_service.so

#LINKER_FORCED_SHIM_LIBS := \
#    /system/lib/libdpframework.so|liblog_mtk.so \
#    /system/bin/guiext-server|liblog_mtk.so \
#    /system/bin/pq|liblog_mtk.so \
#    /system/lib/egl/libGLES_mali.so|liblog_mtk.so \
#    /system/lib/libfmcust.so|liblog_mtk.so \
#    /system/xbin/mnld|liblog_mtk.so \
#    /system/bin/mtk_agpsd|liblog_mtk.so \
#    /system/bin/mobile_log_d|liblog_mtk.so \
#    /system/bin/emdlogger1|liblog_mtk.so \
#    /system/bin/boot_logo_updater|liblog_mtk.so \
#    /system/bin/MtkCodecService|liblog_mtk.so \
#    /system/vendor/lib/libwvm.so|libshim_wvm.so \
#	/system/lib/libui_ext.so|libshim_ui.so \
#	/system/lib/libgui_ext.so|libshim_ui.so \
#    /system/bin/xlog|libmtk_symbols.so \
#    /system/bin/program_binary_service|libmtk_symbols.so \
#    /system/lib/libccci_util.so|libmtk_symbols.so \
#    /system/lib/libfs_mgr.so|libmtk_symbols.so \
#    /system/bin/pq|libshim_bionic.so \
#    /system/lib/egl/libGLES_mali.so|libshim_bionic.so \
#    /system/bin/thermal|libshim_netutils.so \
#    /system/bin/cameraserver|libshim_camera.so \
#    /system/bin/mediaserver|libshim_camera.so \
#    /system/bin/program_binary_service|libshim_ui.so \
#    /system/lib/libcam_utils.so|libshim_ui.so \
#    /system/lib/hw/camera.mt6580.so|libshim_ui.so \
#    /system/lib/hw/camera.mt6580.so|libshim_netutils.so \
#    /system/lib/hw/camera.mt6580.so|libshim_bionic.so \
#    /system/bin/kpoc_charger|liblog_mtk.so \
    

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/compatibility_matrix.xml

# Seccomp policy
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Gatekeeper
BOARD_USE_SOFT_GATEKEEPER := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true
PRODUCT_COMPATIBILITY_MATRIX_LEVEL_OVERRIDE := 27
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# MKE2FS
TARGET_USES_MKE2FS := true

# System Prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Vendor Prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Exfat
TARGET_EXFAT_DRIVER := exfat

# Malloc_svelte
MALLOC_SVELTE := true

# Mediatek audio
BOARD_USES_MTK_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1

# Ignore Neverallow errors for sepolicy
SELINUX_IGNORE_NEVERALLOWS := true

