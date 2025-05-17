#!/bin/bash

# set -x

# 変数の定義
target_dir="${1:-/etc/}"
file_path=$( realpath "${0}" )
base_dir=$( dirname "${file_path}" )
output_dir="${base_dir}/output_dir"
day=$( date '+%Y%m%d' )
output_file="${output_dir}/etc_backup_${day}.tar.gz"

# output_dirの作成
if [[ -d ${output_dir} ]];then
        echo "output_dir already exits"
else
        mkdir -p "${output_dir}"
fi

# tarコマンドでバックアップの作成
tar -czf "${output_file}" "${target_dir}"
