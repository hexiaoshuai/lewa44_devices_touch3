#
# Makefile
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of LEWA rom, the default is porting_lewa.zip if not specified
local-out-zip-file := lewa_touch3.zip

# the location for local-ota to save target-file
local-previous-target-dir := ~/

# All apps from original ZIP, but has smali files chanded
local-modified-apps :=

local-modified-priv-apps :=

local-modified-jars :=

# All apks from LEWA
local-lewa-removed-apps := Bluetooth LewaPond

local-lewa-removed-priv-apps := Settings

local-lewa-modified-apps :=

# Set ro.sys.partner in build.prop for lewa partner
local-lewa-partner := LeWa_Hxs

# Set ro.lewa.device in build.prop for lewa partner
local-lewa-device := Touch3

# The ota assert devices for lewa partner
local-ota-assert-device :=

# Config density for co-developers to use the aaps with HDPI or XHDPI resource,
# Default configrations are HDPI for ics branch and XHDPI for jellybean branch
local-density := XHDPI

include phoneapps.mk

# To include the local targets before and after zip the final ZIP file,
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-pre-zip-misc
local-after-zip:= local-put-to-phone

# The local targets after the zip file is generated, could include 'zip2sd' to
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
updater := $(ZIP_DIR)/META-INF/com/google/android/updater-script
pre_install_data_packages := $(TMP_DIR)/pre_install_apk_pkgname.txt

local-pre-zip-misc: add-prebuilt-lewa-sqlite-library
