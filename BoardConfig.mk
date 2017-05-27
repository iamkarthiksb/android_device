#
# Copyright (C) 2015-2016 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/lenovo/p1a42

# Architecture
TARGET_BOARD_SUFFIX := _64
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true

# Asserts
TARGET_OTA_ASSERT_DEVICE := p1a42,passion_row,p1a41

# Board
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOOTLOADER_BOARD_NAME := MSM8916
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := sched_enable_hmp=1 console=tty60,115200,n8 androidboot.console=tty60 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.emmc=true msm_rtb.filter=0x237 androidboot.hwid=TBD androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --tags_offset 0x00000100
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
TARGET_KERNEL_SOURCE := kernel/lenovo/p1a42
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_USES_UNCOMPRESSED_KERNEL := true
TARGET_KERNEL_CONFIG := p1a42_defconfig

BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_RECOVERY_FSTAB := device/lenovo/p1a42/twrp.fstab

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 41940355
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26843545600
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432

RECOVERY_SDCARD_ON_DATA := true

# don't take forever to wipe
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TARGET_CRYPTFS_HW_PATH := device/lenovo/p1a42/cryptfs_hw

# TWRP
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := RGB_565
TW_NEW_ION_HEAP := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
