#! /system/bin/sh
#***********************************************************
#** Copyright (C), 2008-2016, OPPO Mobile Comm Corp., Ltd.
#** VENDOR_EDIT
#**
#** Version: 1.0
#** Date : 2019/06/25
#** Author: Liangwen.Ke@PSW.CN.BT.Basic.Customize.2120948
#** Add  for supporting QC firmware update by sau_res
#**
#** ---------------------Revision History: ---------------------
#**  <author>    <data>       <version >       <desc>
#**  Liangwen.Ke 2019.6.25      1.0            build this module
#****************************************************************/

config="$1"

saufwdir="/data/oppo/common/sau_res/res/SAU-AUTO_LOAD_FW-10/"
pushfwdir="/data/vendor/bluetooth/fw/"
pushdatadir="data/misc/bluedroid/"

# cp bt sau file to data/vendor/bluetooth dir
function btfirmwareupdate() {

    if [ -f ${saufwdir}/apbtfw11.tlv ]; then
        cp  ${saufwdir}/apbtfw11.tlv  ${pushfwdir}
        chown bluetooth:bluetooth ${pushfwdir}/apbtfw11.tlv
        chmod 0440 bluetooth:bluetooth ${pushfwdir}/apbtfw11.tlv
    fi

    if [ -f ${saufwdir}/apnv11.bin ]; then
        cp  ${saufwdir}/apnv11.bin  ${pushfwdir}
        chown bluetooth:bluetooth ${pushfwdir}/apnv11.bin
        chmod 0440 bluetooth:bluetooth ${pushfwdir}/apnv11.bin
    fi

    if [ -f ${saufwdir}/apbtfw11.ver ]; then
        cp  ${saufwdir}/apbtfw11.ver  ${pushfwdir}
        cp  ${saufwdir}/apbtfw11.ver  ${pushdatadir}
        chown bluetooth:bluetooth ${pushfwdir}/apbtfw11.ver
        chown bluetooth:bluetooth ${pushdatadir}/apbtfw11.ver
        chmod 0440 bluetooth:bluetooth ${pushfwdir}/apbtfw11.ver
        chmod 0440 bluetooth:bluetooth ${pushdatadir}/apbtfw11.ver
    fi
}

# delete all bt sau file
function btfirmwaredelete() {

    if [ -f ${saufwdir}/apbtfw11.tlv ]; then
        rm -rf  ${saufwdir}/apbtfw11.tlv
    fi

    if [ -f ${pushfwdir}/apbtfw11.tlv ]; then
        rm -rf  ${pushfwdir}/apbtfw11.tlv
    fi

    if [ -f ${saufwdir}/apnv11.bin ]; then
        rm -rf  ${saufwdir}/apnv11.bin
    fi

    if [ -f ${pushfwdir}/apnv11.bin ]; then
        rm -rf  ${pushfwdir}/apnv11.bin
    fi

    if [ -f ${saufwdir}/apbtfw11.ver ]; then
        rm -rf  ${saufwdir}/apbtfw11.ver
    fi

    if [ -f ${pushfwdir}/apbtfw11.ver ]; then
        rm -rf  ${pushfwdir}/apbtfw11.ver
    fi

    if [ -f ${pushdatadir}/apbtfw11.ver ]; then
        rm -rf  ${pushdatadir}/apbtfw11.ver
    fi
}

case "$config" in
    "btfirmwareupdate")
        btfirmwareupdate
    ;;

    "btfirmwaredelete")
        btfirmwaredelete
    ;;
esac
