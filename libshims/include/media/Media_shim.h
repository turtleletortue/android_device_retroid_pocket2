#ifndef MEDIA_SHIM_H_
#define MEDIA_SHIM_H_

namespace android {
    // SPS Info Struct
    struct SPSInfo {
	    int32_t width;
	    int32_t height;
	    uint32_t profile;
	    uint32_t level;
    }; // SPSInfo
}  // namespace android

#endif  // MEDIA_SHIM_H_
