#
# Copyright (C) 2011 The CyanogenMod Project
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
# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/cdma.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/express/prebuilt/etc/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    device/htc/express/prebuilt/root/init.express.rc:root/init.express.rc \
    device/htc/express/prebuilt/root/init.express.usb.rc:root/init.express.usb.rc \
    device/htc/express/prebuilt/root/init.rc:root/init.rc \
    device/htc/express/prebuilt/root/init.trace.rc:root/init.trace.rc \
    device/htc/express/prebuilt/root/ueventd.rc:root/ueventd.rc \
    device/htc/express/prebuilt/root/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    device/htc/express/prebuilt/root/ueventd.express.rc:root/ueventd.express.rc

$(call inherit-product-if-exists, vendor/htc/express/express-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.clientidbase=android-sprint-us \
        ro.com.google.locationfeatures=1 \
        ro.cdma.home.operator.numeric=310120 \
        ro.cdma.home.operator.alpha=Sprint \
        ro.setupwizard.enable_bypass=1 \
        dalvik.vm.lockprof.threshold=500 \
        dalvik.vm.dexopt-flags=m=y \
        ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/express/overlay

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0
	
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/express/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    hardware/qcom/audio/msm7x30/audio_policy.conf:system/etc/audio_policy.conf

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/express/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/express/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/express/keychars/express-keypad-v0.kcm.bin:system/usr/keychars/express-keypad-v0.kcm.bin \
    device/htc/express/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/express/keylayout/express-keypad.kl:system/usr/keylayout/express-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/express/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    device/htc/express/prebuilt/etc/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/express/prebuilt/etc/firmware/default_org.acdb:system/etc/firmware/default_org.acdb
	
# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/express/prebuilt/etc/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/express/prebuilt/etc/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/express/prebuilt/etc/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/express/prebuilt/etc/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/express/prebuilt/etc/AIC3254_REG_DualMic_XC.csv:system/etc/AIC3254_REG_DualMic_XC.csv \
    device/htc/express/prebuilt/etc/AIC3254_REG_DualMic_XB.csv:system/etc/AIC3254_REG_DualMic_XB.csv \
    device/htc/express/prebuilt/etc/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/express/prebuilt/etc/AIC3254_REG_DualMic.txt:system/etc/AIC3254_REG_DualMic.txt \
    device/htc/express/prebuilt/etc/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/express/prebuilt/etc/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/express/prebuilt/etc/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/express/prebuilt/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/express/prebuilt/etc/agps_rm:/system/etc/agps_rm

# idc
PRODUCT_COPY_FILES += \
    device/htc/express/idc/synaptics-rmi-touchscreen.idc:/system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/express/idc/Ntrig-touchscreen.idc:/system/usr/idc/Ntrig-touchscreen.idc \
    device/htc/express/idc/Ntrig-Pen-touchscreen-v2.idc:/system/usr/idc/Ntrig-Pen-touchscreen-v2.idc \
    device/htc/express/idc/Ntrig-Pen-touchscreen.idc:/system/usr/idc/Ntrig-Pen-touchscreen.idc


PRODUCT_COPY_FILES += \
    device/htc/express/vold.fstab:system/etc/vold.fstab

# High-density art, but English locale
PRODUCT_LOCALES += en


# media profiles and capabilities spec
$(call inherit-product, device/htc/express/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/express/media_htcaudio.mk)    

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := htc_express 
PRODUCT_DEVICE := express

PRODUCT_PROPERTY_OVERRIDES += \
 ro.telephony.ril.v3=signalstrength
