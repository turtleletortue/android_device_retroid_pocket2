LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	miravision_jni.cpp
	 
LOCAL_C_INCLUDES := \
    $(JNI_H_INCLUDE)

LOCAL_C_INCLUDES += \
    $(TOP)/bionic \
    $(LOCAL_PATH)/inc

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	libpq_cust \
	libdpframework

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE := libMiraVision_jni
LOCAL_MULTILIB := both

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
