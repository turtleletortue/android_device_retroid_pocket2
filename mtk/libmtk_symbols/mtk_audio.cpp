#include <stdint.h>
#include <utils/Log.h>
#include <binder/IServiceManager.h>
#include <media/AudioSystem.h>
#include <media/IAudioFlinger.h>
#include <media/IAudioPolicyService.h>
#include <system/audio.h>

#define LOG_TAG "AUDIO_SHIM"

extern "C" {
    bool _ZN7android11AudioSystem24getVoiceUnlockDLInstanceEv(){
        return 0;
    }
    
    int _ZN7android11AudioSystem23GetVoiceUnlockDLLatencyEv(){
        return 0;
    }
 
    int _ZN7android11AudioSystem17SetVoiceUnlockSRCEjj(uint32_t outSR, uint32_t outChannel){
        return 0;
    }

    bool _ZN7android11AudioSystem18startVoiceUnlockDLEv(){
        return 0;
    }
 
    int _ZN7android11AudioSystem15ReadRefFromRingEPvjS1_(void*buf, uint32_t datasz, void* DLtime){
        return 0;
    }
    
    int _ZN7android11AudioSystem12SetAudioDataEijPv(int a1) {
        return 0;
    }
    
    int _ZN7android11AudioSystem20GetVoiceUnlockULTimeEPv(void* DLtime) {
        return 0;
    }

    void _ZN7android11AudioSystem25freeVoiceUnlockDLInstanceEv(){}

    bool _ZN7android11AudioSystem17stopVoiceUnlockDLEv(){
        return 0;
    }
    
}

