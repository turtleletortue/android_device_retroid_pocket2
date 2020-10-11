#include <stdio.h>
#include <stdlib.h>
#include <log/log.h>

#define LOG_TAG "ProgramBinaryService"

extern "C" {

    /* android::IprogramBinaryService::getInterfaceDescriptor */
    int _ZNK7android21IProgramBinaryService22getInterfaceDescriptorEv(void)
    {
         return 0x0;
    }

    /* android::IProgramBinaryService::descriptor */
    bool _ZN7android21IProgramBinaryService10descriptorE(void)
    {
        return 0x0;
    }

    /* android::IPprogramBinaryService::uiRendererProgramAtlasTerminate */
    int _ZN7android10uirenderer12ProgramAtlas9terminateEv(void)
    {
        return 0x0;
    }

    /* android::IProgramBinaryService::uiRendererProgramAtlasLoadProgramBinariesAndDeleteEPliPvi */
    int _ZN7android10uirenderer12ProgramAtlas28loadProgramBinariesAndDeleteEPliPvi(void)
    {
        return 0x0;
    }

    /* android::IprogramBinaryService::C2Ev */
    int _ZN7android21IProgramBinaryServiceC2Ev(bool C2Ev)
    {
        if (C2Ev) {
           ALOGI("C2Ev is true");
           return 0;
        } else {
           ALOGI("C2Ev is false, abort...");
           return -1;
        }
    }

    /* android::IprogramBinaryService::D2Ev */
    int _ZN7android21IProgramBinaryServiceD2Ev(bool D2Ev)
    {
        if (D2Ev) {
           ALOGI("D2Ev is true");
           return 0;
        } else {
           ALOGI("D2Ev is false, abort...");
           return -1;
        }
    }

    int _ZN7android10uirenderer12ProgramAtlas14createProgramsEPlPi(uint32_t name)
    {
        return 0;
    }

}
