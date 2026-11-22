# SPDX-License-Identifier: Apache-2.0

# Keep the shared gki_defconfig on Full LTO; override only this product.
TARGET_KERNEL_CONFIG_EXT += $(DEVICE_PATH)/standalone-thinlto.config

# Qualcomm external module Makefiles select their configs with this argument.
TARGET_KERNEL_ADDITIONAL_FLAGS += TARGET_BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)

# Keep the GKI modules with the kernel built from the same source tree.
fuxi_gki_modules := $(notdir $(shell cat $(TARGET_KERNEL_SOURCE)/android/gki_system_dlkm_modules))
SYSTEM_KERNEL_MODULES := $(fuxi_gki_modules)
BOARD_SYSTEM_KERNEL_MODULES_LOAD := zsmalloc.ko zram.ko
# These modules are installed in system_dlkm, not vendor_dlkm. Keep them
# in the recovery ramdisk list, where system_dlkm may not be available.
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(filter-out $(fuxi_gki_modules),$(BOARD_VENDOR_KERNEL_MODULES_LOAD))

# Use the platform's standard logical-partition update package, with a
# device-specific flash plan so a source-built DTBO is not omitted.
TARGET_BOARD_FASTBOOT_INFO_FILE := $(DEVICE_PATH)/fastboot-info.txt

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/dolby-vision-recording/compatibility_matrix.xml

# Use a locally supplied RSA-4096 key, never the public AOSP AVB test key.
# For a local engineering build the build wrapper generates it in OUT_DIR.
BOARD_AVB_KEY_PATH := $(or $(FUXI_STANDALONE_AVB_KEY),$(OUT_DIR)/fuxi-avb.pem)
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS :=
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := $(BOARD_AVB_KEY_PATH)
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

BOARD_AVB_RECOVERY_KEY_PATH := $(BOARD_AVB_KEY_PATH)
BOARD_AVB_RECOVERY_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
