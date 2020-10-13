// From https://github.com/rote66/android_device_sony_pine/blob/c9b0c305fb361bedb78c95f9b4cb1bbd9b766c82/mediatek/libmtk_symbols/vtservice.cpp
/*
 * Copyright (C) 2018 Tobias Tefke
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <inttypes.h>
#include <sys/types.h>
#include <log/log.h>

extern "C" {
     void _ZN7android12AudioPCMxWayD1Ev() {}
     void _ZN7android12AudioPCMxWayC1EiPFviPvS1_ES1_() {}
     void _ZN7android12AudioPCMxWay5startEv() {}
     void _ZN7android12AudioPCMxWay4stopEv() {}
     void _ZN7android12AudioPCMxWay4readEPvj() {}
     void _ZN7android14FindAVCSPSInfoEPhjPNS_7SPSInfoE() {}
     int _ZN7android14ICameraService11asInterfaceERKNS_2spINS_7IBinderEEE(uint32_t cameraid, uint32_t clientid) 
    {
        ALOGI("CameraServiceInterfaceBinder: Camera ID=%u, Client ID=%u", cameraid, clientid);
        return 0;
    }

// From https://github.com/archos-sa/aos-android-libs/blob/d70bb8a91c645299bfe65ca66e731865cb7237cf/common/libskia.c
    void _Z8SkDebugfPKcz() {}
    void _Z8SkMulDiviii() {}
    void _Z8sk_fopenPKc12SkFILE_Flags() {}
    void _Z8sk_freadPvjP6SkFILE() {}
    void _Z8sk_throwv() {}
    void _ZNK8SkBitmap9eraseARGBEjjjj() {}
    int _ZN7android11QueryCodecsERKNS_2spINS_4IOMXEEEPKcbbPNS_6VectorINS_17CodecCapabilitiesEEE(int a1, int a2, int a3, signed int a4, int a5)
    {
        int v13;
        int v9 = a3 ^ 1;
        //android::VectorImpl::VectorImpl(&v13, 8, 0);
        v13 = 8;
        //android::VectorImpl::clear(a5);
        return v9;
    }

}
