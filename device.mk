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

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Kernel prebuilt
PRODUCT_COPY_FILES += \
	$(KERNEL_PATH)/Image.gz:kernel

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