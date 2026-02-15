#!/bin/bash
#attach external HDDs to wsl
WSL_EXE="/mnt/c/Windows/System32/wsl.exe"
for i in {1..10}; do
    if $WSL_EXE --mount "\\\\.\\PHYSICALDRIVE$i" --bare > /dev/null 2>&1 ; then
    	echo "Attached disk $i"
    fi
done
#mount OLD HDD
mkdir -p /mnt/hd_externo
mount UUID=111c2127-50c6-4005-a541-e2441d7c2cba /mnt/hd_externo
#mount new HDD
cryptsetup open UUID=d7210228-d2d7-4e2f-bb64-ce360035fd49 --key-file=/etc/luks-keys/key_hd_externo_wd2tb hd_externo_wd2tb
mkdir -p /mnt/hd_externo_wd2tb
mount /dev/mapper/hd_externo_wd2tb /mnt/hd_externo_wd2tb/
