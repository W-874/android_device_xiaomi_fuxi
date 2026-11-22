# Stock Dolby workers embed the VNDK33 AHandler base layout.
$(call soong_config_set_bool,frameworks_av,legacy_vendor_ahandler,true)
# Stock Dolby codecs allocate GraphicBuffer using the VNDK33 size.
$(call soong_config_set_bool,libui,legacy_vendor_graphicbuffer,true)

PRODUCT_PACKAGES += \
    dolbycodec2 \
    c2.dolby.store \
    fuxi_dv_c2.dolby.client \
    fuxi_dv_c2.dolby.hevc.enc \
    fuxi_dv_libEncoderProcessor \
    fuxi_dv_libeglcore \
    fuxi_dv_libdolbyottcameracontrol \
    fuxi_dv_libfuxi_dv_codec2_soft_common \
    fuxi_dv_libfuxi_dv_sfplugin_ccodec_utils \
    libcodec2_shim

PRODUCT_COPY_FILES += \
    device/xiaomi/fuxi/dolby-vision-recording/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml

PRODUCT_PACKAGES += \
    fuxi_dv_c2.dolby.hevc.dec \
    fuxi_dv_c2.dolby.hevc.sec.dec \
    fuxi_dv_libDecoderProcessor
