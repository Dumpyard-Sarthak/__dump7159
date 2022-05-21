#!/vendor/bin/sh

config="$1"

function doAddRadioFile(){
    if [[ -d /mnt/vendor/opporeserve/radio ]]; then
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_switch.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_switch.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_region_netlock.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_region_netlock.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_simlock_switch.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_simlock_switch.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_simlock_times.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_simlock_times.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_open_market_singlecard.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_open_market_singlecard.config
        fi

        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_devicelock_status.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_devicelock_status.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_devicelock_imsi.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_devicelock_imsi.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_devicelock_iccid.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_devicelock_iccid.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_devicelock_days.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_devicelock_days.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_devicelock_first_bind_time.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_devicelock_first_bind_time.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_devicelock_last_bind_time.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_devicelock_last_bind_time.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_devicelock_unlock_time.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_devicelock_unlock_time.config
        fi

        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_switch.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_region_netlock.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_simlock_switch.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_simlock_times.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_open_market_singlecard.config

        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_devicelock_status.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_devicelock_imsi.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_devicelock_iccid.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_devicelock_days.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_devicelock_first_bind_time.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_devicelock_last_bind_time.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_devicelock_unlock_time.config

        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_switch.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_region_netlock.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_simlock_switch.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_simlock_times.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_open_market_singlecard.config

        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_devicelock_status.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_devicelock_imsi.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_devicelock_iccid.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_devicelock_days.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_devicelock_first_bind_time.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_devicelock_last_bind_time.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_devicelock_unlock_time.config
    fi
}

function doStartDiagSocketLog {
    ip_address=`getprop vendor.oppo.diag.socket.ip`
    port=`getprop vendor.oppo.diag.socket.port`
    retry=`getprop vendor.oppo.diag.socket.retry`
    channel=`getprop vendor.oppo.diag.socket.channel`
    if [[ -z "${ip_address}" ]]; then
        ip_address=181.157.1.200
    fi
    if [[ -z "${port}" ]]; then
        port=2500
    fi
    if [[ -z "${retry}" ]]; then
        port=10000
    fi
    if [[ -z "${channel}" ]]; then
        diag_socket_log -a ${ip_address} -p ${port} -r ${retry}
    else
        diag_socket_log -a ${ip_address} -p ${port} -r ${retry} -c ${channel}
    fi
}

#ifdef ODM_WT_EDIT
#Rui.Li@ODM_WT.AD.engineeringmode, 2020/05/06,add for use wt vendor bin sensorcali to do  psensor cali
function doStartSensorCali {
    echo "doStartSensorCali enter"
    near=`getprop vendor.wt.sensorcali.near`
    mCmData=`getprop vendor.wt.sensorcali.mcmdata`
    offset=`getprop vendor.wt.sensorcali.offset`

    if [[ -z "${near}" ]]; then
        setprop vendor.wt.sensorcali.result false
        return
    fi
    if [[ -z "${mCmData}" ]]; then
        setprop vendor.wt.sensorcali.result false
        return
    fi
    if [[ -z "${offset}" ]]; then
        setprop vendor.wt.sensorcali.result false
        return
    fi

    echo "sensorcali 8 ${near} ${mCmData} ${offset}"

    result=$(sensorcali 8 ${near} ${mCmData} ${offset}|grep write_cali_data\ write\ success)

    if [[ "$result" != "" ]]
    then
        setprop vendor.wt.sensorcali.result true
    else
        setprop vendor.wt.sensorcali.result false
    fi
}
#endif ODM_WT_EDIT

function doStopDiagSocketLog {
    diag_socket_log -k
}

case "$config" in
#ifdef ODM_WT_EDIT
#Rui.Li@ODM_WT.AD.engineeringmode, 2020/05/06,add for use wt vendor bin sensorcali to do  psensor cali 
    "startSensorCali")
    doStartSensorCali
    ;;
#endif ODM_WT_EDIT
    "addRadioFile")
    doAddRadioFile
    ;;
    "startDiagSocketLog")
    doStartDiagSocketLog
    ;;
    "stopDiagSocketLog")
    doStopDiagSocketLog
    ;;
esac
