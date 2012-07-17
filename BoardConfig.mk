#
# Copyright (C) 2011 The Android Open-Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_AUDIO_LEGACY := false
USE_CAMERA_STUB := false



TARGET_USES_OLD_LIBSENSORS_HAL := false

# Use the non-open-source parts, if they're present
-include vendor/malata/smba1002/BoardConfigVendor.mk

#Built from source kernel
#TARGET_KERNEL_CONFIG        := tegra_smba1002_defconfig
#TARGET_KERNEL_SOURCE        := kernel/malata/smba1002

#TARGET_NO_RECOVERY := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
#TARGET_HAVE_TEGRA_ERRATA_657451 := true
ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_KERNEL_BASE := 0x10000000
#Stock CMDLINE
#BOARD_KERNEL_CMDLINE := tegra_fbmem=8192000@0x1e018000 video=tegrafb console=tty0,115200n8 androidboot.console=tty0 mem=1024M@0M lp0_vec=8192@0x1e7f1020 lcd_manfid=AUO usbcore.old_scheme_first=1 tegraboot=nand mtdparts=tegra_nand:16384K@9984K(misc),16384K@26880K(recovery),16384K@43904K(boot),204800K@60928K(system),781824K@266240K(cache)
BOARD_KERNEL_CMDLINE := mem=448M@0M nvmem=64M@448M vmalloc=192M video=tegrafb console=ttyS0,115200n8 usbcore.old_scheme_first=1 cpuid=200102 devicetype=1002 bspversion=0202100907 btmac=9c5ed6131a00 tegraboot=nand mtdparts=tegra_nand:16384K@12032K(misc),16384K@62208K(recovery),16384K@79104K(boot),253696K@96000K(system),173312K@350464K(cache),4096K@7424K(bootbmp),32768K@28928K(logodata)
#androidboot.carrier=wifi-only product_type=w
BOARD_PAGE_SIZE := 0x00000800

TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := harmony
#TARGET_BOARD_INFO_FILE := device/malata/smba1002/board-info.txt
BOARD_EGL_CFG := device/malata/smba1002/files/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_DISABLE_TRIPLE_BUFFERING := false

BOARD_USES_OVERLAY := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0c800000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/malata/smba1002/kernel

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

PRODUCT_CHARACTERISTICS := tablet
BOARD_USES_SECURE_SERVICES := true

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
