#include <string>
#include <dlfcn.h>

#include <ui/GraphicBufferMapper.h>
#include <ui/GraphicBuffer.h>

#include <ui/PixelFormat.h>

#include <ui/Rect.h>

extern "C" {

    void _ZN7android19GraphicBufferMapper9lockYCbCrEPK13native_handlejRKNS_4RectEP13android_ycbcr(
            buffer_handle_t, uint32_t, const android::Rect&, android_ycbcr*);

    void _ZN7android19GraphicBufferMapper9lockYCbCrEPK13native_handleiRKNS_4RectEP13android_ycbcr(
            buffer_handle_t handle, int usage, const android::Rect& bounds, android_ycbcr *ycbcr) {
        _ZN7android19GraphicBufferMapper9lockYCbCrEPK13native_handlejRKNS_4RectEP13android_ycbcr(
            handle, static_cast<uint32_t>(usage), bounds, ycbcr);
    }

    void _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(
        const native_handle_t* handle,
        android::GraphicBuffer::HandleWrapMethod method,
        uint32_t width,
        uint32_t height,
        int format,
        uint32_t layerCount,
        uint64_t usage,
        uint32_t stride);

    void _ZN7android13GraphicBufferC1EjjijjP13native_handleb(uint32_t inWidth, uint32_t inHeight, int inFormat, uint32_t inUsage, uint32_t inStride, native_handle_t* inHandle, bool keepOwnership)
    {
        android::GraphicBuffer::HandleWrapMethod inMethod = (keepOwnership ? android::GraphicBuffer::TAKE_HANDLE : android::GraphicBuffer::WRAP_HANDLE);
        _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(inHandle, inMethod, inWidth, inHeight, inFormat, static_cast<uint32_t>(1), static_cast<uint64_t>(inUsage), inStride);
    }

    void _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(
            buffer_handle_t, uint32_t, const android::Rect&, void**);

    void _ZN7android19GraphicBufferMapper4lockEPK13native_handleiRKNS_4RectEPPv(
           buffer_handle_t handle, int usage, const android::Rect& bounds, void** vaddr) {
        _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(
           handle, static_cast<uint32_t>(usage), bounds, vaddr);
    }
}
