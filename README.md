# android_device_xiaomi_surya_twrp
For building TWRP for POCO X3 / X3 NFC (codenamed "karna / surya")

TWRP device tree for POCO X3 (karna/surya)

## Features

Works:

- ADB
- Decryption of /data
- Screen brightness settings
- Vibration support
- Correct screenshot color
- MTP
- Flashing (opengapps, roms, images and so on)
- Backup/Restore
- USB OTG
- Fasbootd

## Compile

First checkout minimal twrp:

```
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
repo sync --force-sync
```
Download tree surya A11:

```
git clone https://github.com/FabricioSC123/device-xiaomi-surya-twrp.git -b android-11 device/xiaomi/surya

```



Finally execute these:

```
. build/envsetup.sh
lunch twrp_surya-eng
mka recoveryimage ALLOW_MISSING_DEPENDENCIES=true # Only if you use minimal twrp tree.
```

To test it:

```
fastboot boot out/target/product/surya/recovery.img
```

## Other Sources

Using precompiled stock kernel.
