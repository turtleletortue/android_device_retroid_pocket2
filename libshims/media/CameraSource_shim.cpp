#define LOG_TAG "CameraSource_shim"

#include <stdlib.h>
#include <stdint.h>

#include <media/stagefright/CameraSource.h>
#include <media/stagefright/CameraSourceTimeLapse.h>

#include <camera/CameraBase.h>
#include <camera/ICameraRecordingProxy.h>
#include <camera/ICameraRecordingProxyListener.h>

#include <camera/android/hardware/ICamera.h>
#include <camera/android/hardware/ICameraClient.h>

#include <ui/GraphicBuffer.h>
#include <ui/GraphicBufferMapper.h>

#include <log/log.h>

/* kMetadataBufferTypeGraphicBuffer is used to indicate that
 * the payload of the metadata buffers can be interpreted as
 * an ANativeWindowBuffer, and that a fence is provided.
 */
#define kMetadataBufferTypeANWBuffer 2 

using namespace android;

extern "C" {

    /* Android N */
    extern int _ZN7android12CameraSource16CreateFromCameraERKNS_2spINS_8hardware7ICameraEEERKNS1_INS_21ICameraRecordingProxyEEEiRKNS_8String16EjiNS_4SizeEiRKNS1_INS_22IGraphicBufferProducerEEEb(const sp<hardware::ICamera>& camera, const sp<ICameraRecordingProxy>& proxy, int32_t cameraId, const String16& clientName, uid_t clientUid, pid_t clientPid, Size videoSize, int32_t frameRate, const sp<IGraphicBufferProducer>& surface, bool storeMetaDataInVideoBuffers);

    /* 
     * FUNCTION NAME: CameraSource::CreateFromSource.
     * USE: Factory method to create a new CameraSource.
     * NOTES: It looks like this function was renamed in N. Stub out to the correct call.
     */
    void _ZN7android12CameraSource16CreateFromCameraERKNS_2spINS_7ICameraEEERKNS1_INS_21ICameraRecordingProxyEEEiRKNS_8String16EjNS_4SizeEiRKNS1_INS_22IGraphicBufferProducerEEEb(
        const sp<hardware::ICamera>& camera,
        const sp<ICameraRecordingProxy>& proxy,
        int32_t cameraId,
        const String16& clientName,
        uid_t clientUid,
        pid_t clientPid,
        Size videoSize,
        int32_t frameRate,
        const sp<IGraphicBufferProducer>& surface,
        bool storeMetaDataInVideoBuffers) {

        _ZN7android12CameraSource16CreateFromCameraERKNS_2spINS_8hardware7ICameraEEERKNS1_INS_21ICameraRecordingProxyEEEiRKNS_8String16EjiNS_4SizeEiRKNS1_INS_22IGraphicBufferProducerEEEb(
            camera,
            proxy,
            cameraId,
            clientName,
            clientUid,
            clientPid,
            videoSize,
            frameRate,
            surface,
            storeMetaDataInVideoBuffers);
    }
            
    /* 
     * FUNCTION NAME: CameraSource::isMetaDataStoredInVideoBuffersEv.
     * USE: Tell whether this camera source stores meta data or real YUV frame data in video buffers.
     * NOTES: It looks like this function was renamed in N. Stub out to the correct call.
     */
    int _ZNK7android12CameraSource30isMetaDataStoredInVideoBuffersEv()
    {
        ALOGV("isMetaDataStoredInVideoBuffers");
        return kMetadataBufferTypeANWBuffer;
    }
}
