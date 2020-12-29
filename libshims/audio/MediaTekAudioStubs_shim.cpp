#include <stdlib.h>
#include <dlfcn.h>
#include <stdint.h>

#include <MtpTypes.h>
#include <system/audio.h>
#include <media/IAudioFlinger.h>
#include <hardware/audio.h>

#include "common.h"

namespace android {

    typedef void (*audio_error_callback)(status_t err);

    class AudioSystem
    {
    public:
        static bool getVoiceUnlockDLInstance();
        static int GetVoiceUnlockDLLatency();
        static int SetVoiceUnlockSRC(uint outSR, uint outChannel);
        static bool stopVoiceUnlockDL();
        static bool startVoiceUnlockDL();
        static int ReadRefFromRing(void*buf, uint32_t datasz,void* DLtime);
        static int GetVoiceUnlockULTime(void* DLtime);
        static void freeVoiceUnlockDLInstance();
    }; /* Audio System Class */

    /* _ZN7android11AudioSystem24getVoiceUnlockDLInstanceEv */
    bool AudioSystem::getVoiceUnlockDLInstance()
    {
        return 0;
    }

    /* _ZN7android11AudioSystem23GetVoiceUnlockDLLatencyEv */
    int AudioSystem::GetVoiceUnlockDLLatency()
    {
        return 0;
    }

    /* _ZN7android11AudioSystem17SetVoiceUnlockSRCEjj */
    int AudioSystem::SetVoiceUnlockSRC(PGM_GNUC_UNUSED uint outSR, PGM_GNUC_UNUSED uint outChannel)
    {
        return 0;
    }

    /* _ZN7android11AudioSystem17stopVoiceUnlockDLEv */
    bool AudioSystem::stopVoiceUnlockDL()
    {
        return 0;
    }

    /* _ZN7android11AudioSystem18startVoiceUnlockDLEv */
    bool AudioSystem::startVoiceUnlockDL()
    {
        return 0;
    }

    /* _ZN7android11AudioSystem15ReadRefFromRingEPvjS1_ */
    int AudioSystem::ReadRefFromRing(PGM_GNUC_UNUSED void*buf, PGM_GNUC_UNUSED uint32_t datasz, PGM_GNUC_UNUSED void* DLtime)
    {
        return 0;
    }

    /* _ZN7android11AudioSystem20GetVoiceUnlockULTimeEPv */
    int AudioSystem::GetVoiceUnlockULTime(PGM_GNUC_UNUSED void* DLtime)
    {
        return 0;
    }

    /* _ZN7android11AudioSystem25freeVoiceUnlockDLInstanceEv */
    void AudioSystem::freeVoiceUnlockDLInstance()
    {
        return;
    }

    class IATVCtrlClient {}; /* ATVCtrlClient */

    class IATVCtrlService: public IInterface
    {
        public:
            DECLARE_META_INTERFACE(ATVCtrlService);
    };

    class BpATVCtrlService : public BpInterface<IATVCtrlService>
    {
        public:
            BpATVCtrlService(const sp<IBinder>& impl)
                : BpInterface<IATVCtrlService>(impl) {}

        virtual ~BpATVCtrlService() {}

        virtual int ATVCS_matv_init()
        {
            return 0;
        }

        virtual int ATVCS_matv_ps_init(PGM_GNUC_UNUSED int on)
        {
            return 0;
        }

        virtual int ATVCS_matv_set_parameterb(PGM_GNUC_UNUSED int in)
        {
            return 0;
        }

        virtual int ATVCS_matv_suspend(PGM_GNUC_UNUSED int on)
        {
            return 0;
        }

        virtual int ATVCS_matv_shutdown()
        {
            return 0;
        }

        virtual void ATVCS_matv_chscan(PGM_GNUC_UNUSED int mode) {}

        virtual void ATVCS_matv_chscan_stop() {}

        virtual int ATVCS_matv_get_chtable(PGM_GNUC_UNUSED int ch, PGM_GNUC_UNUSED void *entry, PGM_GNUC_UNUSED int len)
        {
            return 0;
        }

        virtual int ATVCS_matv_set_chtable(PGM_GNUC_UNUSED int ch, PGM_GNUC_UNUSED void *entry, PGM_GNUC_UNUSED int len)
        {
            return 0;
        }

        virtual int ATVCS_matv_clear_chtable()
        {
            return 0;
        }

        virtual void ATVCS_matv_change_channel(PGM_GNUC_UNUSED int ch) {}

        virtual void ATVCS_matv_set_country(PGM_GNUC_UNUSED int country) {}

        virtual void ATVCS_matv_set_tparam(PGM_GNUC_UNUSED int mode) {}

        virtual void ATVCS_matv_audio_play() {}

        virtual void ATVCS_matv_audio_stop() {}

        virtual int ATVCS_matv_audio_get_format()
        {
            return 0;
        }

        virtual void ATVCS_matv_audio_set_format(PGM_GNUC_UNUSED int val) {}

        virtual int ATVCS_matv_audio_get_sound_system()
        {
            return 0;
        }

        virtual int ATVCS_matv_adjust(PGM_GNUC_UNUSED int item, PGM_GNUC_UNUSED int val)
        {
            return 0;
        }

        virtual int ATVCS_matv_get_chipdep(PGM_GNUC_UNUSED int item)
        {
            return 0;
        }

        virtual int ATVCS_matv_set_chipdep(PGM_GNUC_UNUSED int item, PGM_GNUC_UNUSED int val)
        {
            return 0;
        }

        virtual void ATVCS_matv_register_callback() {}

        virtual void registerClient(PGM_GNUC_UNUSED const sp<IATVCtrlClient>& client) {}

        virtual void registerClient_FM(PGM_GNUC_UNUSED const sp<IATVCtrlClient>& client) {}

        virtual void CLI(PGM_GNUC_UNUSED char input) {}

        virtual int ATVCS_fm_powerup(PGM_GNUC_UNUSED void *parm, PGM_GNUC_UNUSED int len)
        {
            return 0;
        }

        virtual int ATVCS_fm_powerdown()
        {
            return 0;
        }

        virtual int ATVCS_fm_getrssi()
        {
            return 0;
        }

        virtual int ATVCS_fm_tune(PGM_GNUC_UNUSED void *parm, PGM_GNUC_UNUSED int len)
        {
            return 0;
        }
 
        virtual int ATVCS_fm_seek(PGM_GNUC_UNUSED void *parm, PGM_GNUC_UNUSED int len)
        {
            return 0;
        }

        virtual int ATVCS_fm_scan(PGM_GNUC_UNUSED void *parm, PGM_GNUC_UNUSED int len)
        {
            return 0;
        }

        virtual int ATVCS_fm_mute(PGM_GNUC_UNUSED int val)
        {
            return 0;
        }

        virtual int ATVCS_fm_getchipid()
        {
            return 0;
        }

        virtual int ATVCS_fm_isFMPowerUp()
        {
            return 0;
        }
    };

    IMPLEMENT_META_INTERFACE(ATVCtrlService, "android.media.IATVCtrlService");

} /* Namespace Android */

