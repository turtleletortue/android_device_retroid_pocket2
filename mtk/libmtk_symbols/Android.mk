# Copyright (C) 2020 The MAD Team
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    mtk_asc.cpp \
    mtk_audio.cpp \
    mtk_omx.cpp \
    mtk_misc.cpp \
    mtk_xlog.c \
    mtk_icu.cpp

# 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp
# 64bit libraries end

LOCAL_SHARED_LIBRARIES := libbinder liblog libgui libui libmedia libbase libstagefright_foundation libicuuc libicui18n libcrypto
LOCAL_MODULE := libmtk_symbols
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
