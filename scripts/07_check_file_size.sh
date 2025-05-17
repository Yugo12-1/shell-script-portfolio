#!/bin/bash

# set -x

# ファイルを標準入力から受け取る
read -p "サイズを確認したいファイル名を入力してください: " input_file
target_file=$( realpath "${input_file}" )

# ファイルが存在しているかどうか
if [[ ! -f "${target_file}" ]]; then
        echo "ファイルが存在していません"
        exit 1
fi

# ファイルサイズの上限を設定: 10MB(KB単位)
max_file_size=10240

# ファイルサイズのチェック（物理サイズ）
target_file_size=$( du -B 1024 "${target_file}" | cut -f 1 )
echo "===================  FILESIZE =========================="
echo "${input_file}の現在のファイルサイズは、${target_file_size}(KB)です"
echo "========================================================"

# 上限を超えている場合
if (( "${target_file_size}" >= "${max_file_size}" )); then
        echo "===================  WARNING  =========================="
        echo "10MBを超過しています。ファイルサイズの見直しをしてくさい"
        echo "========================================================"
fi
