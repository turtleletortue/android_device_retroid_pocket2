#define LOG_TAG "CRYPTO_SHIM"

#include <stdint.h>
#include <stdlib.h>
#include <log/log.h>

extern "C"
{
    void CRYPTO_free(void *str) {
        ALOGD("CRYPTO_free: str=%s", str);
        free(str);
    }

    void CRYPTO_malloc(int num, const char *file, int line) {
        ALOGD("CRYPTO_malloc: num=%d file=%s line=%d", num, file, line);
        malloc(num);
    }

    void CRYPTO_lock(int mode, int type, const char *file, int line) {
        ALOGD("CRYPTO_lock: mode=%d type=%d file=%s line=%d", mode, type, file, line);
    }
}
