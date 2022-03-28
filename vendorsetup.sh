# Add pocket2 to lunch menu

# AOSP
# User builds
add_lunch_combo aosp_pocket2-user
# With debug stuff
add_lunch_combo aosp_pocket2-userdebug

# Eng builds
add_lunch_combo aosp_pocket2-eng

# LineageOS
# User builds
add_lunch_combo lineage_pocket2-user
# With debug stuff
add_lunch_combo lineage_pocket2-userdebug

# Eng builds
add_lunch_combo lineage_pocket2-eng

# LineageOS ATV builds
# User builds
add_lunch_combo lineage_atv_pocket2-user
# With debug stuff
add_lunch_combo lineage_atv_pocket2-userdebug

# Eng builds
add_lunch_combo lineage_atv_pocket2-eng

# Grab repola
echo " "
echo "Checking for repola"
workingDir=$(pwd)
if [ -f $workingDir/device/retroid/pocket2/prebuilt/RePoLa/launcher-release.apk ]; then
    echo "repola apk exists, proceed"
fi
if [ ! -f $workingDir/device/retroid/pocket2/prebuilt/RePoLa/launcher-release.apk ]; then
    echo "Downloading latest"
    cd device/retroid/pocket2/prebuilt/RePoLa/ && wget https://github.com/sreichholf/repola/releases/latest/download/launcher-release.apk && echo " " && echo "Success!" && cd ../../../../../
fi
echo " "
