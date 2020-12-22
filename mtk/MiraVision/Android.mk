
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_JAVA_LIBRARIES := bouncycastle
LOCAL_JAVA_LIBRARIES += framework

LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4

# for projects can't support 1080p video, so replaced with 720p resource
#ifeq ($(MTK_GMO_RAM_OPTIMIZE),yes)
#    LOCAL_ASSET_DIR := $(LOCAL_PATH)/assets_slim
#endif

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := MiraVision
LOCAL_JNI_SHARED_LIBRARIES := libMiraVision_jni
LOCAL_CERTIFICATE := platform

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE := libpq_cust
LOCAL_SRC_FILES := lib/libpq_cust.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_PACKAGE_NAME := libpq_cust
include $(BUILD_PREBUILT)

# Use the folloing include to make our test apk.
include $(call all-makefiles-under,$(LOCAL_PATH))

