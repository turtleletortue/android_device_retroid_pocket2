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
TARGET_KERNEL_CONFIG := real6580_weg_m_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
BOARD_MKBOOTIMG_ARGS := --pagesize 2048 --base 0x80000000 --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --second_offset 0x00f00000 --tags_offset 0x0e000000 --cmdline "bootopt=64S3,32S1,32S1 androidboot.selinux=permissive"
#TARGET_PREBUILT_KERNEL := device/retroid/pocket2/kernel

# Images
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5259657216
BOARD_FLASH_BLOCK_SIZE := 131072

# EGL
USE_OPENGL_RENDERER := true

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

# MTK
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

# Charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode

# Recovery resources
TARGET_RECOVERY_FSTAB := device/retroid/pocket2/rootdir/recovery.fstab
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

# Shims
LINKER_FORCED_SHIM_LIBS := \
    /system/lib/libdpframework.so|liblog_mtk.so\
    /system/bin/guiext-server|liblog_mtk.so\
    /system/bin/pq|liblog_mtk.so\
    /system/lib/egl/libGLES_mali.so|liblog_mtk.so\
    /system/lib/libfmcust.so|liblog_mtk.so\
    /system/xbin/mnld|liblog_mtk.so\
    /system/bin/mtk_agpsd|liblog_mtk.so\
    /system/bin/mobile_log_d|liblog_mtk.so\
    /system/bin/emdlogger1|liblog_mtk.so\

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include
