# Copyright (C) 2023-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from RMX3521 device
$(call inherit-product, device/realme/RMX3521/device.mk)

PRODUCT_DEVICE := RMX3521
PRODUCT_NAME := lineage_RMX3521
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme 9 4G
PRODUCT_MANUFACTURER := realme
PRODUCT_PLATFORM := bengal

PRODUCT_GMS_CLIENTID_BASE := android-$(PRODUCT_BRAND)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="RMX3521-user 13 RKQ1.211119.001 S.e3b4a5_66a4_66a5 release-keys"

BUILD_FINGERPRINT := $(PRODUCT_BRAND)/RMX3521/RE54E2L1:13/RKQ1.211119.001/S.e3b4a5_66a4_66a5:user/release-keys