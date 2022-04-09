/*
 * Copyright (C) 2016 The CyanogenMod Project
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

#include <gui/BufferQueue.h>
#include <gui/SurfaceComposerClient.h>
#include <ui/Rect.h>
#include <utils/Errors.h>
#include <utils/String8.h>
#include <utils/StrongPointer.h>

#include <string>

using namespace android;
using android::sp;
using android::status_t;
using android::IBinder;
using android::IGraphicBufferConsumer;
using android::IGraphicBufferProducer;
using android::PixelFormat;
using android::Rect;
using android::SurfaceControl;

android::SurfaceComposerClient::Transaction *t;

// static void SurfaceComposerClient::setDisplayProjection(const sp<IBinder>& token,
//                                                         uint32_t orientation,
//                                                         const Rect& layerStackRect,
//                                                         const Rect& displayRect);
extern "C" { 
    extern void _ZN7android14SurfaceControl8setLayerEi(int32_t) {}
    extern void _ZN7android14SurfaceControl7destroyEv(void);
    extern void *_ZN7android21SurfaceComposerClient23getPhysicalDisplayTokenEy(unsigned long long) { return 0; } /*FIXME*/

    void _ZN7android21SurfaceComposerClient20setDisplayProjectionERKNS_2spINS_7IBinderEEEjRKNS_4RectES8_(
        const sp<IBinder>& token, uint32_t orientation, const Rect& layerStackRect,
        const Rect& displayRect) {
            android::SurfaceComposerClient::Transaction t;
            t.setDisplayProjection(token, orientation, layerStackRect, displayRect);
            t.apply();
    }

    void _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjijPNS_14SurfaceControlEjj(
	    android::String8 const & s,
	    uint32_t w,
	    uint32_t h,
	    android::PixelFormat fmt,
	    uint32_t flags,
	    void *parent,
	    uint32_t windowType,
	    uint32_t ownerUid) {/*FIXME*/}

    /* 
    * FUNCTION NAME: SurfaceComposerClient::CreateSurface.
    * USE: Creates a surface.
    * NOTES: It looks like this function was renamed in N. Stub out to the correct call.
    */
    void _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8Ejjij(android::String8 const& s, uint32_t w, uint32_t h,
        android::PixelFormat fmt, uint32_t flags) {
        /* sp<SurfaceControl> android::SurfaceComposerClient::createSurface(android::String8 const&, unsigned int, unsigned int, int, unsigned int) */
        _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjijPNS_14SurfaceControlEjj(s, w, h, fmt, flags, NULL, 0, 0);
    }

    void _ZN7android21SurfaceComposerClient22closeGlobalTransactionEb() {
        t->apply();
        delete t;
        t = nullptr;
    }

    void _ZN7android14SurfaceControl5clearEv(void) {
        _ZN7android14SurfaceControl7destroyEv();
    }

    void _ZN7android21SurfaceComposerClient21openGlobalTransactionEv() {
        t = new(android::SurfaceComposerClient::Transaction);
    }

    void *_ZN7android21SurfaceComposerClient17getBuiltInDisplayEi(int32_t id) {
        return _ZN7android21SurfaceComposerClient23getPhysicalDisplayTokenEy(static_cast<uint64_t>(id));
    }
}
