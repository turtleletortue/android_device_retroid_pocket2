LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := AudioFX ExactCalculator Calendar Camera2 Email Messaging Phone Recorder Exchange2 Eleven Contacts Mms MmsService TelephonyProvider WAPPushManager TeleService Telecom init.lineage.atv.rc
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
