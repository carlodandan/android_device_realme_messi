# Copyright (C) 2023-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

KERNEL_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)-kernel

# Get non-open-source specific aspects (proprietaries)
$(call inherit-product, vendor/realme/messi/messi-vendor.mk)

# Get virtual-ab-ota properties
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch.mk)

# A/B
AB_OTA_PARTITIONS += system system_ext vendor product odm boot recovery dtbo vbmeta vbmeta_system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/vendor/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/vendor/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/vendor/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/vendor/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/vendor/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/vendor/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/vendor/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/vendor/bluetooth_qti_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_hearing_aid_audio_policy_configuration.xml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/odm/audio_effects.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/odm/audio_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/odm/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/odm/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/odm/mixer_paths.xml:$(TARGET_COPY_OUT_ODM)/etc/mixer_paths.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    bootctrl.bengal \
    bootctrl.bengal.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/vendor/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/vendor/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/vendor/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/vendor/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/vendor/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/vendor/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/configs/gps/vendor/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/odm/gps.conf:$(TARGET_COPY_OUT_ODM)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/odm/izat.conf:$(TARGET_COPY_OUT_ODM)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/odm/sap.conf:$(TARGET_COPY_OUT_ODM)/etc/sap.conf \

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/common/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/common/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_performance_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_performance_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v2.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_performance_v3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v3.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_vendor_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_vendor_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v2.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_vendor_v3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v3.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_profiles_khaje.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_khaje.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_profiles_scuba.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_scuba.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media/vendor/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/odm/media_codecs_ffmpeg.xml:$(TARGET_COPY_OUT_ODM)/etc/media_codecs_ffmpeg.xml \
    $(LOCAL_PATH)/configs/media/odm/media_codecs_odm.xml:$(TARGET_COPY_OUT_ODM)/etc/media_codecs_odm.xml \
    $(LOCAL_PATH)/configs/media/odm/media_codecs_vendor_oplus.xml:$(TARGET_COPY_OUT_ODM)/etc/media_codecs_vendor_oplus.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Kernel prebuilt
PRODUCT_COPY_FILES += \
	$(KERNEL_PATH)/Image.gz:kernel

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/AVRCP.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/AVRCP.idc \
    $(LOCAL_PATH)/keylayout/AVRCP.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Overlays
$(call inherit-product, hardware/oplus/overlay/qssi/qssi.mk)

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/common/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QCOM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/common/privapp-permissions-oplus.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/common/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/common/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom

# Screen density
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client