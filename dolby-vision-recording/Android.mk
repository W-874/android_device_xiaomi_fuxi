LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),fuxi)
include $(CLEAR_VARS)
LOCAL_MODULE := dolbycodec2
LOCAL_CPP_STD := c++20
LOCAL_VENDOR_MODULE := true
LOCAL_MULTILIB := 64
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := service.cpp
LOCAL_INIT_RC := dolbycodec2.rc
LOCAL_VINTF_FRAGMENTS := dolbycodec2.xml
LOCAL_SHARED_LIBRARIES := \
    android.hardware.media.c2@1.0 \
    c2.dolby.store \
    libbase \
    libbinder \
    libcodec2_hidl@1.0 \
    libhidlbase \
    libutils
include $(BUILD_EXECUTABLE)

define fuxi-dv-library
include $$(CLEAR_VARS)
LOCAL_MODULE := $(if $(2),$(2),fuxi_dv_$(1))
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_STEM := $(1)
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := lib64/$(1).so
LOCAL_VENDOR_MODULE := true
LOCAL_MULTILIB := 64
LOCAL_CHECK_ELF_FILES := false
include $$(BUILD_PREBUILT)
endef
$(eval $(call fuxi-dv-library,c2.dolby.store,c2.dolby.store))
$(foreach lib,c2.dolby.client c2.dolby.hevc.enc libEncoderProcessor libeglcore libdolbyottcameracontrol libfuxi_dv_codec2_soft_common libfuxi_dv_sfplugin_ccodec_utils,$(eval $(call fuxi-dv-library,$(lib))))
endif

ifeq ($(TARGET_DEVICE),fuxi)
$(foreach lib,c2.dolby.hevc.dec c2.dolby.hevc.sec.dec libDecoderProcessor,$(eval $(call fuxi-dv-library,$(lib))))
endif
