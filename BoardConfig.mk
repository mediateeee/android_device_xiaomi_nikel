#
# Copyright 2014 The Android Open-Source Project
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

# Use the non-open-source parts, if they're present
-include vendor/xiaomi/nikel/BoardConfigVendor.mk

LOCAL_PATH := device/xiaomi/nikel
OUT := out

# mt6797 platform boardconfig

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6797
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true

# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_CPU_CORTEX_A53 := true

# Board
TARGET_BOOTLOADER_BOARD_NAME := mt6797

# Ashmem
DISABLE_ASHMEM_TRACKING := true
BOARD_NO_SECURE_DISCARD := true

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x04f88000 --second_offset 0x00000000 --tags_offset 0x03f88000 --board nikel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

# Hack for building without kernel sources
ifeq ($(TARGET_DEVICE),nikel)
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
endif

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=3221225472
BOARD_CACHEIMAGE_PARTITION_SIZE:=452984832
BOARD_USERDATAIMAGE_PARTITION_SIZE:=3221225472
BOARD_RECOVERYIMAGE_PARTITION_SIZE:=16777216
BOARD_BOOTIMAGE_PARTITION_SIZE:=16777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true

# Display
USE_OPENGL_RENDERER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/etc/egl.cfg

# Boot animation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true

# Audio
# USE_XML_AUDIO_POLICY_CONF := 1

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# Consumerir
MTK_IRTX_SUPPORT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab

# SYS.PORP
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Seccomp filter
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp
