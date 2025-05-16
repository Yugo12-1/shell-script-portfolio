#!/bin/bash

# set -x

# ファイルの定義
output_dir="/var/log/old"

# 関数の定義
function rename_compless(){
  # 引数を受け取る。ex) /var/log/messages-20250315
  local input_file="${1}"

  # 日付の部分を取り出す。
  local day=$( echo "${input_file}" | awk -F '-' '{print $2}' )

  # 新しいファイル名を定義
  local output_file="${output_dir}/messages-old-${day}.tar.gz"

  # 圧縮
  tar -czf "${output_file}" "${input_file}"
  echo "${output_file}を生成しました。"
}

# /var/log/配下にある、messagesのローテイションされたファイルをループ
for file in /var/log/messages-*
do
        # 各ファイルに対して、リネームして圧縮
        rename_compless "${file}"
        result="${?}"

        if [[ "${result}" -ne 0 ]];then
                echo "${file}の処理に失敗しました。"
                exit 1
        fi
done