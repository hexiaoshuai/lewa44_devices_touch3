#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13707264 86e3fc640638d54a28a9f6809fd6bc869b8f564d 11370496 0909bdc0eecdb6acccd4526b6669dea8557cbaf9
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:13707264:86e3fc640638d54a28a9f6809fd6bc869b8f564d; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:11370496:0909bdc0eecdb6acccd4526b6669dea8557cbaf9 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 86e3fc640638d54a28a9f6809fd6bc869b8f564d 13707264 0909bdc0eecdb6acccd4526b6669dea8557cbaf9:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
