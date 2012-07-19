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
# inherit from the common version first
-include device/malata/smba-common/BoardConfigCommon.mk

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false

# Use the non-open-source parts, if they're present
-include vendor/malata/smba1002/BoardConfigVendor.mk

#arhitecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

#Built from source kernel (future for CM)
#TARGET_KERNEL_CONFIG        := tegra_smba1002_defconfig
#TARGET_KERNEL_SOURCE        := kernel/malata/smba1002

BOARD_KERNEL_CMDLINE := mem=448M@0M nvmem=64M@448M vmalloc=192M video=tegrafb console=ttyS0,115200n8 usbcore.old_scheme_first=1 cpuid=200102 devicetype=1002 bspversion=0202100907 btmac=9c5ed6131a00 tegraboot=nand mtdparts=tegra_nand:16384K@12032K(misc),16384K@62208K(recovery),16384K@79104K(boot),253696K@96000K(system),173312K@350464K(cache),4096K@7424K(bootbmp),32768K@28928K(logodata)
#BOARD_KERNEL_CMDLINE := mem=448M@0M nvmem=64M@448M vmalloc=192M video=tegrafb console=ttyS0,115200n8 usbcore.old_scheme_first=1

TARGET_PREBUILT_KERNEL := device/malata/smba1002/prebuilt/kernel

TARGET_OTA_ASSERT_DEVICE := harmony,smba1002

BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0FA00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAVE_MAGNETIC_SENSOR := true

BOARD_USES_MMEA_GPS := true

BOARD_USES_SECURE_SERVICES := true

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_USERIMAGES_USE_EXT4 := false
