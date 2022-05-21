#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:d03f43c49e372cb21e538900ec65bf4b54d7bbca; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:7c1ae590dc0f09fe1c7b7d261a09519bc4a64238 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:d03f43c49e372cb21e538900ec65bf4b54d7bbca && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
