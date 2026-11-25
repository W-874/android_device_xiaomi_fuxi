#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Select the fuxi effects configuration before the common kalama fallback.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/audio_effects.xml

# Inherit from sm8550-common
TARGET_HAS_UDFPS := true
$(call inherit-product, device/xiaomi/sm8550-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/fuxi/fuxi-vendor.mk)

# Keep MusicFX as the standard per-session equalizer alongside global DAP.
$(call soong_config_set_bool,lunaris_dolby,keep_stock_music_panel,true)

# The stock DMS EventHandler uses the legacy vendor AHandler layout.
$(call soong_config_set_bool,frameworks_av,legacy_vendor_ahandler,true)

# Dolby Atmos playback. The camera Codec2 product is configured separately.
PRODUCT_PACKAGES += \
    LunarisDolby \
    DolbyOverlayFuxi \
    libhwdap \
    libdlbvol \
    libswgamedap \
    vendor.dolby.hardware.dms@2.0-service

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio/mixer_paths_kalama_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/mixer_paths_kalama_mtp.xml \
    $(LOCAL_PATH)/config/audio/resourcemanager_kalama_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/resourcemanager_kalama_mtp.xml

# eUICC
PRODUCT_PACKAGES += \
    XiaomiEuicc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/permissions/privapp-permissions-euiccgoogle.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-euiccgoogle.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.fuxi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.fuxi.rc \

# Overlay
PRODUCT_PACKAGES += \
    EuiccResFuxi \
    FrameworkResOverlayFuxi \
    SystemUIOverlayFuxi \
    SettingsOverlayFuxi \
    WifiOverlayFuxi

# PowerShare
$(call soong_config_set,lineage_powershare,powershare_path,/sys/class/qcom-battery/reverse_chg_mode)
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

# WeChat fingerprint payment (Qualcomm SOTER)
PRODUCT_PACKAGES += SoterService

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
