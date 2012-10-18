# Inherit device configuration
$(call inherit-product, device/htc/express/full_express.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

# Inherit WiMAX stuff
#$(call inherit-product, vendor/ev/config/wimax.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := express
PRODUCT_NAME := ev_express
PRODUCT_BRAND := HTC
PRODUCT_MODEL := Evo View
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi BUILD_FINGERPRINT="google/nakasi/grouper:4.1.1/JRO03D/402395:user/release-keys" PRIVATE_BUILD_DESC="nakasi-user 4.1.1 JRO03D 402395 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Effor
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Evo Shift 4G\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @jmz_software for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/ev/overlay/hot_reboot

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/xga/media/bootanimation.zip:system/media/bootanimation.zip

# USB
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage