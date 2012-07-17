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

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/malata/smba1002/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/malata/smba1002/overlay

# uses mdpi artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

TARGET_BOOTANIMATION_NAME := horizontal-1280x800

# smba1002/Harmony Configs
PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel \
    device/malata/smba1002/files/init.harmony.rc:root/init.harmony.rc \
    device/malata/smba1002/files/init.harmony.usb.rc:root/init.harmony.usb.rc \
    device/malata/smba1002/files/ueventd.harmony.rc:root/ueventd.harmony.rc \
    device/malata/smba1002/files/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/malata/smba1002/files/nvram.txt:system/etc/wifi/nvram.txt

# Modules
PRODUCT_COPY_FILES += \
    device/malata/smba1002/modules/auth_rpcgss.ko:system/lib/modules/auth_rpcgss.ko \
    device/malata/smba1002/modules/ff-memless.ko:system/lib/modules/ff-memless.ko \
    device/malata/smba1002/modules/hid-sony.ko:system/lib/modules/hid-sony.ko \
    device/malata/smba1002/modules/lockd.ko:system/lib/modules/lockd.ko \
    device/malata/smba1002/modules/nfs.ko:system/lib/modules/nfs.ko \
    device/malata/smba1002/modules/ntfs.ko:system/lib/modules/ntfs.ko \
    device/malata/smba1002/modules/sunrpc.ko:system/lib/modules/sunrpc.ko \
    device/malata/smba1002/modules/tun.ko:system/lib/modules/tun.ko \
    device/malata/smba1002/modules/xpad.ko:system/lib/modules/xpad.ko

# Bluetooth
PRODUCT_COPY_FILES += \
    device/malata/smba1002/files/bcm4329.hcd:system/etc/firmware/bcm4329.hcd

	
# Touchscreen
PRODUCT_COPY_FILES += \
    device/malata/smba1002/files/at168_touch.idc:system/usr/idc/at168_touch.idc 
# media codec config xml file

PRODUCT_COPY_FILES += \
    device/malata/smba1002/files/media_codecs.xml:system/etc/media_codecs.xml

# Graphics
PRODUCT_COPY_FILES += \
    device/malata/smba1002/files/media_profiles.xml:system/etc/media_profiles.xml

# Generic
PRODUCT_COPY_FILES += \
   device/malata/smba1002/files/vold.fstab:system/etc/vold.fstab

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    ro.sf.lcd_density=120 \
    wifi.supplicant_scan_interval=15

# Live Wallpapers
PRODUCT_PACKAGES += \
	HoloSpiralWallpaper \
        LiveWallpapersPicker \
        VisualizationWallpapers

#Audio
PRODUCT_PACKAGES += \
        audio.a2dp.default \
	audio.primary.harmony \
        libaudioutils

# Harmony Hardware
PRODUCT_PACKAGES += \
	sensors.harmony \
	lights.harmony \
	gps.harmony 
#	libmbm-ril
        
# These are the hardware-specific feature permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml 

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

#Set default.prop properties for root + adb
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	persist.service.adb.enable=1

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	persist.service.adb.enable=1

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory 

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
	PRODUCT_PACKAGES += send_bug
	PRODUCT_COPY_FILES += \
		system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
		system/extras/bugmailer/send_bug:system/bin/send_bug
endif

# Copy bcm4329 firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

# Make it optional to include vendor stuff..Just to be nice ;)
ifneq ($(TARGET_IGNORE_VENDOR),yes)
$(call inherit-product, vendor/malata/smba1002/device-vendor.mk)
endif
