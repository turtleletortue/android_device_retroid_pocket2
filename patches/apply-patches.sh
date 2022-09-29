# We change directory into the corresponding folders of the patched items, and then use patch -p1 on them

cd ../../../../
echo "Applying patches..."

# Recovery patch
cd bootable/recovery
patch -p1 < ../../device/retroid/pocket2/patches/bootable/recovery/0001-pocket2-Fix-Items-to-Fit-on-Screen.patch
patch -p1 < ../../device/retroid/pocket2/patches/bootable/recovery/0002-pocket1-Use-Back-Button-As-Down.patch
cd ../../

# Build/make/core patch
cd build/make/
patch -p1 < ../../device/retroid/pocket2/patches/build/make/core/fix_atv_target.patch
cd ../../

# Screenshots and Power Off UI patches
cd frameworks/base
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/base/0001-Pocket2-Fix-Screenshots.patch
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/base/0002-Use-Pre-Oreo-Power-Off-UI-and-add-Reboot-to-Recovery.patch
patch -p1 < ../../device/retroid/pocket2/patches/frameworks/base/0003-Fix-Screen-Res-Wallpapers.patch
cd ../../

# App patches
cd packages/apps

# Settings patch (remove encryption)
cd Settings
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/Settings/0001-Remove-Encrypt-device-option-in-Settings.patch
cd ../

# SetupWizard patches (remove emergency call, set double clicking home as app switcher, resize resolution to 640x480)
cd SetupWizard
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/SetupWizard/0001-Remove-Emergency-Call-Option.patch
cd ../

# Trebuchet patches (allow package Launcher3Go to be included and add back all apps button)
cd Trebuchet
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/Trebuchet/0001-Allow-Trebuchet-and-Launcher3Go-to-coexist.patch
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/Trebuchet/0002-Use-all-apps-button-in-Trebuchet.patch
cd ../

# TVSettings patches
cd TvSettings
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/TvSettings/add-reboot-to-recovery.patch
cd ../../..

# Remove log spam of invalid usage bits
cd hardware/interfaces
patch -p1 < ../../device/retroid/pocket2/patches/hardware/interfaces/0001-Ignore-Usage-Bits-Warnings.patch
cd ../..

# Exit
cd device/retroid/pocket2/patches
echo "Done"
