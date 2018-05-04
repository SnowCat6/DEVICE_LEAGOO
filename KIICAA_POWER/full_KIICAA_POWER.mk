# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Set target and base project for flavor build
MTK_TARGET_PROJECT := $(subst full_,,$(TARGET_PRODUCT))
MTK_BASE_PROJECT := $(MTK_TARGET_PROJECT)
MTK_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_BASE_PROJECT))
MTK_TARGET_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_TARGET_PROJECT))

# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
# Inherit from maguro device
$(call inherit-product, device/LEAGOO/KIICAA_POWER/device.mk)

# set locales & aapt config.
PRODUCT_LOCALES := en_US zh_CN zh_TW es_ES pt_BR ru_RU fr_FR de_DE tr_TR vi_VN ms_MY in_ID th_TH it_IT ar_EG hi_IN bn_IN ur_PK fa_IR pt_PT nl_NL el_GR hu_HU tl_PH ro_RO cs_CZ ko_KR km_KH iw_IL my_MM pl_PL es_US bg_BG hr_HR lv_LV lt_LT sk_SK uk_UA de_AT da_DK fi_FI nb_NO sv_SE en_GB hy_AM zh_HK et_EE ja_JP kk_KZ sr_RS sl_SI ca_ES

# Set those variables here to overwrite the inherited values.
PRODUCT_MANUFACTURER := T591
PRODUCT_NAME := full_KIICAA_POWER
PRODUCT_DEVICE := KIICAA_POWER
PRODUCT_MODEL := KIICAA POWER
PRODUCT_POLICY := android.policy_phone
PRODUCT_BRAND := LEAGOO

TARGET_BOOTLOADER_BOARD_NAME=t591_otd_kiicaa_n_we
BUILD_FINGERPRINT := LEAGOO/KIICAA_POWER/KIICAA_POWER:7.0/NRD90M/1512480092:user/release-keys
PRIVATE_BUILD_DESC := "KIICAA_POWER-user" "7.0" "NRD90M" "1517390049" "release-keys"
TARGET_OTA_ASSERT_DEVICE := KIICAA_POWER
PRODUCT_DEFAULT_LOCALE := ru_RU

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEFCONFIG ?= KIICAA_POWER_defconfig
else
KERNEL_DEFCONFIG ?= KIICAA_POWER_defconfig
endif
#PRELOADER_TARGET_PRODUCT ?= KIICAA_POWER
#LK_PROJECT ?= KIICAA_POWER
#TRUSTY_PROJECT ?= KIICAA_POWER
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

include $(LOCAL_PATH)/twrp.mk
