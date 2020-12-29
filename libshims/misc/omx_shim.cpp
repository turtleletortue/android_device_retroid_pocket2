#define LOG_TAG "OMX_SHIM"

#include <dlfcn.h>

#include <linux/ion.h>
#include <log/log.h>

#define ION_HEAP_TYPE_MULTIMEDIA_FOR_CAMERA 12
#define ION_HEAP_CAMERA_MASK (1 << ION_HEAP_TYPE_MULTIMEDIA_FOR_CAMERA)

extern "C" {
/* libion/_mtk.so */
int ion_alloc_camera(int fd, size_t len, size_t align, unsigned int flags,
              ion_user_handle_t *handle)
{
    void *lib_handle;
    void (*ion_alloc)(int fd, size_t len, size_t align, unsigned int heap_mask,
              unsigned int flags, ion_user_handle_t *handle); // ion_alloc 

    /* Try to dlopen libion_mtk.so */
    lib_handle = dlopen("libion.so", RTLD_LAZY);

    if (!lib_handle) 
    {
        /* Fail to load the library */
        ALOGE("dlopen failed: Could not load libion.so");
        return -1;
    }

    ALOGI("dlopen libion.so succeed");

    /* Get ion_alloc_mm */
    *(void**)(&ion_alloc) = dlsym(handle, "ion_alloc");

    if (!ion_alloc) 
    {
        /* No such symbol */
        ALOGE("dlsym failed: Cannot find ion_alloc symbol");
        dlclose(lib_handle);
        return -1;
    }

    ALOGI("dlsym ion_alloc succeed");

    ion_alloc(fd, len, align, ION_HEAP_CAMERA_MASK, flags, handle);
    dlclose(lib_handle);

    return 0; // all ok
}
} // extern c

/* libstagefright.so */
extern "C" {
    void _ZN7android13AwesomePlayer24mtk_omx_get_current_timeEPx(long long* time){
        time = (long long*)-1;
    }
}

/* libdpframework.so */
extern "C" {
    extern void _ZN11DpIspStream11startStreamEP7timeval() {} // FIXME
    void _ZN11DpIspStream11startStreamEv() {
        _ZN11DpIspStream11startStreamEP7timeval();
    }

    extern void _ZN11DpIspStream15dequeueFrameEndEPj() {} // FIXME
    void _ZN11DpIspStream15dequeueFrameEndEv() {
        _ZN11DpIspStream15dequeueFrameEndEPj();
    }
}
