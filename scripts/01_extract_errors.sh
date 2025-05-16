#!/bin/bash

# set -x

# ファイルの定義
check_file="/var/log/messages"
day=$( date '+%Y%m%d' )
file_path=$( realpath "${0}" )
base_dir=$( dirname "${file_path}" )
output_dir="${base_dir}/output_dir"
output_file="${output_dir}/error_${day}.log"

# output_dirのディレクトリの作成
# 初回のみディレクトリを作成する。
if [[ -d "${output_dir}" ]];then
        echo "output_dirはすでに存在します。"
else
        mkdir "${output_dir}"
fi

# check_fileからエラー情報を抽出する
grep -Ei "error|fail" "${check_file}" > "${output_file}"