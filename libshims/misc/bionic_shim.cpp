/*
 * Copyright (C) 2020 The LineageOS Project
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

#include <pthread.h>
#include <sys/system_properties.h>

/* extern bool __system_property_wait(const prop_info* pi, uint32_t old_serial, uint32_t* new_serial_ptr,
            const timespec* relative_timeout); */

extern "C" {
pid_t __pthread_gettid(pthread_t t) {
    return pthread_gettid_np(t);
  }
}

extern "C" {
uint32_t __system_property_wait_any(uint32_t old_serial) {
  uint32_t new_serial;
  __system_property_wait(nullptr, old_serial, &new_serial, nullptr);
  return new_serial;
  }
}
