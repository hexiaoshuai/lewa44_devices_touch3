lewa44_devices_touch3
======================
乐蛙 4.4项目

天语Touch3 高配适配项目源码公开 基于CM11

使用方法

进入coron项目

git clone https://github.com/HeXiaoShuai/lewa44_devices_touch3.git

mv ./lewa44_devices_touch3 ./touch3

cd ..

. build/envsetup.sh

cd touch3

make fullota

本项目持续更新

更新方法

cd touch3

git pull

===========================
小技巧:
1.添加ota签名选择
ota_from_target_files

OPTIONS.sign_ota = False

  if OPTIONS.sign_ota is True:
    SignOutput(temp_zip_file.name, args[1])
  else:
    print ">>> not sign ota files, just copy...."
    open(args[1], "wb").write(open(temp_zip_file.name, "rb").read())
  temp_zip_file.close()

  common.Cleanup()

  print "done."


2.注意recovery.fstab拉包后三个数值的顺序 不对的话参考下面
ota_target_from_phone

function extract_recovery_fstab {
    echo "Extract recovery.fstab from device"
    adb shell cat /etc/recovery.fstab | awk '{print $2 "\t" $3 "\t" $1}'> $RECOVERY_ETC_DIR/recovery.fstab
}




