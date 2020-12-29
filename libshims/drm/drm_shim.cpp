#ifndef _GNU_SOURCE
#define _GNU_SOURCE

#define LOG_TAG "EVP_CRYPTO"

#include <string.h>
#include <stdio.h>
#include <dlfcn.h>
#include <stdint.h>

#include <log/log.h>
#include <openssl/evp.h>

extern "C" {

  typedef EVP_PKEY *(*orig_EVP_PKEY_new_mac_key_type)(int type, ENGINE *e, const uint8_t *mac_key, size_t mac_key_len);

  EVP_PKEY *EVP_PKEY_new_mac_key(int type, ENGINE *e, const uint8_t *mac_key, size_t mac_key_len) {
     void *crypto_library;

     orig_EVP_PKEY_new_mac_key_type orig_EVP_PKEY_new_mac_key;

     EVP_PKEY *ret = NULL;

     ALOGI("EVP_PKEY_new_mac_key[0x%08X] (orig_EVP_PKEY_new_mac_key, %d ...)\n", type);

     crypto_library = dlopen("/system/lib/libcrypto.so", RTLD_LAZY);

     if (!crypto_library) {
         ALOGI("Cannot dlopen crypto library.");
         return NULL;
     }

     orig_EVP_PKEY_new_mac_key = (orig_EVP_PKEY_new_mac_key_type) dlsym(crypto_library, "EVP_PKEY_new_mac_key");    	
     ret = orig_EVP_PKEY_new_mac_key(type,e,mac_key,mac_key_len);
     return ret;

   }

}

#endif // _GNU_SOURCE
