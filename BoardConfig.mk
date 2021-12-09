#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sm6150
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := sm6150
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618
QCOM_BOARD_PLATFORMS += sm6150

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Kernel
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x880000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1  loop.max_part=7 androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
ifeq ($(TARGET_PREBUILT_KERNEL),)
  TARGET_KERNEL_CONFIG := surya_defconfig
  TARGET_KERNEL_CLANG_COMPILE := true
  TARGET_KERNEL_SOURCE := kernel/xiaomi/surya
endif

# Assert
TARGET_OTA_ASSERT_DEVICE := surya,karna

# Avb
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist cust
BOARD_SUPPRESS_SECURE_ERASE := true

# Super
BOARD_SUPER_PARTITION_SIZE := 8589934592
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8585740288
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    product \
    system_ext \
    vendor \
    system  

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
TW_INCLUDE_FUSE_NTFS := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += ashmemd
TW_RECOVERY_ADDITIONAL_RELINK_BINARY_FILES += \
    $(TARGET_OUT_EXECUTABLES)/ashmemd

TARGET_RECOVERY_DEVICE_MODULES += \
    ashmemd_aidl_interface-cpp \
    libashmemd_client

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
PLATFORM_VERSION := 127
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# fix miui a11 decryption
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# TWRP specific build flags
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_NO_SCREEN_BLANK := true
TW_SUPPORT_INPUT_1_2_HAPTICS := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_EXCLUDE_TWRPAPP := true

# Debug flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# USB Mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"

# The path to a temperature sensor
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone19/temp"
