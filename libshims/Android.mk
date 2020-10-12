LOCAL_PATH := $(call my-dir)

# /system/vendor/lib/libwvm.so | /system/lib/libstagefright.so
include $(CLEAR_VARS)
LOCAL_SRC_FILES := wvm.cpp
LOCAL_SHARED_LIBRARIES := libstagefright_foundation libmedia libstagefright_omx libstagefright_yuv libdrmframework liblog libstagefright
LOCAL_MODULE := libshim_wvm
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# /system/lib/libgui_ext.so | /system/lib/libcam.utils.so
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ui.cpp
LOCAL_SHARED_LIBRARIES := libui libgui libbinder liblog libcutils libutils liblog
LOCAL_MODULE := libshim_ui
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# /system/lib/libdrmmtkutil.so
include $(CLEAR_VARS)
LOCAL_SRC_FILES := drm.cpp
LOCAL_LDLIBS := -ldl
LOCAL_SHARED_LIBRARIES := liblog libdrmframework liblog libcrypto
LOCAL_MODULE := libshim_drm
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := netutils.cpp
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libshim_netutils
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := bionic.cpp
LOCAL_MODULE := libshim_bionic
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_32_BIT_ONLY := true
LOCAL_SHARED_LIBRARIES := libc
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_SRC_FILES := camera.cpp
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_32_BIT_ONLY := true
LOCAL_SHARED_LIBRARIES := libgui libui libcamera_client
include $(BUILD_SHARED_LIBRARY)
