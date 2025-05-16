#!/bin/bash

# set -x

# ファイルの定義
file_path=$( realpath "${0}" )
base_dir=$( dirname "${file_path}" )
output_dir="${base_dir}/output_dir"
day=$( date '+%Y%m%d' )
output_file="${output_dir}/system_info_${day}.log"
timestamp=$( date '+%Y/%m/%d/%H:%M:%S' )

# output_dir, output_fileの作成(初回のみ)
if [[ ! -d "${output_dir}" && ! -f "${output_file}" ]];then
        mkdir -p "${output_dir}"
        echo "timestamp,cpu(%),cpu_idle(%),memory(%),swap(%),disk(%)" > "${output_file}"

elif [[ -d "${output_dir}" && ! -f "${output_file}" ]];then
        # output_dirは存在するけど、output_fileがないとき(1日の初回)
        echo "timestamp,cpu(%),cpu_idle(%),memory(%),swap(%),disk(%)" > "${output_file}"
fi

# cpu使用率の取得
vmstat_result=$( vmstat | tail -n 1 )
cpu_utilization=$( echo "${vmstat_result}" | awk '{print ($13 + $14)}' )
cpu_idle=$( echo "${vmstat_result}" | awk '{print $15}' )

# memory使用率の取得
free_result=$( free )
memory_usage=$( echo "${free_result}" | grep "Mem" | awk '{print int($3 / $2 * 100)}' )
swap_usage=$( echo "${free_result}" | grep "Swap" | awk '{print int($3 / $2 * 100)}' )

# disk(/ ディレクトリ)使用率の取得
disk_usage=$( df -h | awk '$NF=="/" {print $5}' | sed 's/%//g' )


# 出力結果の格納
echo "${timestamp},${cpu_utilization},${cpu_idle},${memory_usage},${swap_usage},${disk_usage}" >> "${output_file}"