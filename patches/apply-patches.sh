#!/bin/bash
cd ../../../..
cd packages/apps/Settings
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/Settings/0001-Remove-encryption-option.patch
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/Settings/0002-add-MiraVision-in-Settings.patch
cd ../Trebuchet
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/Trebuchet/0001-Allow-Launcher3-and-Trebuchet-to-coexist.patch
git clean -f -d
cd ../../..
cd system/core
patch -p1 < ../../device/retroid/pocket2/patches/system/core/0001-Fix-Liblog-printif.patch
patch -p1 < ../../device/retroid/pocket2/patches/system/core/0002-Prevent-spamming-audio.patch
patch -p1 < ../../device/retroid/pocket2/patches/system/core/0003-Remove-CAP_SYS_NICE-from-surfaceflinger.patch
patch -p1 < ../../device/retroid/pocket2/patches/system/core/0004-libnetutils-add-MTK-bits-ifc_ccmni_md_cfg.patch
patch -p1 < ../../device/retroid/pocket2/patches/system/core/0005-PATCH-xen0n-some-MTK-services-e.g.-ril-daemon-mtk-re.patch
patch -p1 < ../../device/retroid/pocket2/patches/system/core/0006-healthd-correctly-report-battery-voltage-on-MTK-kernels.patch
cd ../..
cd bionic
patch -p1 < ../device/retroid/pocket2/patches/bionic/0001-Apply-LIBC-version-to-__pthread_gettid.patch
cd ..
cd frameworks/av
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/av/0001-frameworks_av.patch
cd ../..
cd frameworks/native
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/native/0001-frameworks_native.patch
cd ../..
cd frameworks/base
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/base/0001-Fix-Minior-Bugs.patch
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/base/0002-frameworks_base.patch
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/base/0003-fix-out-of-memory-gl-crashes.patch
cd ../..
cd system/netd
patch -p1 < ../../device/retroid/pocket2/patches/system/netd/0001-wifi-tethering-fix.patch
cd ../..
cd external/wpa_supplicant_8
patch -p1 < ../../device/retroid/pocket2/patches/external/wpa_supplicant_8/0001-IGNORE-FAKE-NVRAM.patch
patch -p1 < ../../device/retroid/pocket2/patches/external/wpa_supplicant_8/0002-fix-wlan-hidden-wifi-scan.patch
cd ../..
