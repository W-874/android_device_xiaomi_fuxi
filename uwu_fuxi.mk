#
# SPDX-License-Identifier: Apache-2.0
#
# Xiaomi 13 main-system product, based on the LineageOS 24 fuxi device tree.

$(call inherit-product, build/make/target/product/full_base_telephony.mk)
$(call inherit-product, build/make/target/product/core_64_bit.mk)
$(call inherit-product, device/xiaomi/fuxi/device.mk)

# MiuiCamera Leica port (fuxi only).
$(call inherit-product, vendor/xiaomi/camera/miuicamera.mk)

UWU_DEVICE_TYPE := phone
UWU_SUPPORTS_TELEPHONY := true
$(call inherit-product, vendor/uwu/config/common.mk)

PRODUCT_DEVICE := fuxi
PRODUCT_NAME := uwu_fuxi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 2211133C
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := true

$(call inherit-product, device/xiaomi/fuxi/dolby-vision-recording/recording.mk)
