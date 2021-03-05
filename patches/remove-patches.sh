# Git reset all affected folders

cd ../../../../

# Recovery
cd bootable/recovery
git reset --hard 
cd ../../

# Frameworks/base
cd frameworks/base
git reset --hard
cd ../../

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

# Exit
cd ../../device/retroid/pocket2/patches
