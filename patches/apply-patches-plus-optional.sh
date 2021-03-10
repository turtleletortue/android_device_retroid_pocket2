echo "Applying optional patches"

cd ../../../../

# Add custom build version
cd packages/apps/Settings
patch -p1 < ../../../device/retroid/pocket2/patches/packages/apps/Settings/optional-Add-Custom-Build-Version.patch
cd ../../../

cd device/retroid/pocket2/patches

./apply-patches.sh
