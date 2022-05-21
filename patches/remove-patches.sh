# Git reset all affected folders

cd ../../../../

# Recovery
cd bootable/recovery
git reset --hard 
cd ../../

# Build/make/core
cd build/make/core
git reset --hard 
cd ../../..

# Frameworks/base
cd frameworks/base
git reset --hard
cd ../../

cd system/core
git reset --hard
git clean -f -d
cd ../..

# Settings
cd packages/apps/Settings
git reset --hard
cd ../

# SetupWizard
cd SetupWizard
git reset --hard
cd ../

# Trebuchet
cd Trebuchet
git reset --hard
cd ../

# TvSettings
cd TvSettings
git reset --hard
git clean -f -d
cd ../

# Hardware/interfaces
cd ../../hardware/interfaces
git reset --hard
cd ../..

# Exit
cd device/retroid/pocket2/patches
