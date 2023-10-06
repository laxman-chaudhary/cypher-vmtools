#!/bin/bash

#检查系统是否支持virtio
#运行程序通知后台修改配置
#修改配置程序

#安装包名
declare -r g_install_archive="VMOptimizationToolsLinux.tar.gz"

#解压的目录名
declare -r g_tar_dir="VMOptimizationToolsLinux"

#解压的上级目录
declare -r g_temp_dir="/var"

#安装包里的安装程序
declare -r g_tar_install="vmtools-install.sh"

#检查系统命令
declare -r cmd_check="busybox_cmd_ln.sh"

#当前目录
declare g_current_dir=""

main(){
    #判断是否是root用户
    if [ $UID -ne 0 ]; then
        echo "Please re-run this program as the super user."            #提示信息，不删掉
        exit 1
    fi
    g_current_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    #清理环境
    rm -rf "${g_temp_dir}/${g_tar_dir}" 2>/dev/null
    #新建目录
    mkdir -p "${g_temp_dir}/${g_tar_dir}" 2>/dev/null
    #解压
    tar -xmzf "${g_current_dir}/${g_install_archive}" --overwrite -C "${g_temp_dir}/${g_tar_dir}"

    #执行系统命令的检查
    chmod +x "${g_temp_dir}/${g_tar_dir}/${cmd_check}"

    "${g_temp_dir}/${g_tar_dir}/${cmd_check}"

    #运行安装程序
    chmod +x "${g_temp_dir}/${g_tar_dir}/${g_tar_install}"

    "${g_temp_dir}/${g_tar_dir}/${g_tar_install}"
}


main "${@}"
