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



