#!/bin/bash

# set -x

# 端末切断,割りこみ,端末切断時の処理を記述
trap "unexpected_func" 1 2 15

unexpected_func(){
        local trap_timestamp=$( date '+%Y/%m/%d %H:%M:%S')

        # output_fileが存在する場合
        if [[ -f "${output_file}" ]]; then
                echo ""
                echo "======= ${trap_timestamp} ======" >> "${output_file}"
                echo "予期せぬ終了が発生しました" >> "${output_file}"
        # output_fileが存在しない場合
        else
                echo ""
                echo "======= ${trap_timestamp} ======"
                echo "予期せぬ終了が発生しました"
        fi

        exit 2
}

# ファイル関連の変数定義
script_path=$( realpath "${0}" )
base_dir=$( dirname "${script_path}" )
output_dir="${base_dir}/output_dir"
day=$( date '+%Y%m%d' )
output_file="${output_dir}/port_check_${day}.log"
timestamp=$( date '+%Y/%m/%d %H:%M:%S')

# 出力先のディレクトリを作成 初回のみ
if [[ ! -d "${output_dir}" ]]; then
        mkdir -p "${output_dir}"
fi

# ユーザーからport番号を受け取る
read -p "チェックしたいポート番号を入力して下さい(ex 22): " target_port

# 数字以外の入力をした場合には、スクリプトの終了(sshなど)
if [[ ! "${target_port}" =~ ^[0-9]+$ ]]; then
        echo "ポート番号は数字で指定して下さい"
        exit 1
fi

# 該当ポートの確認
result=$( ss -tuln | awk -v port="${target_port}" '$5 ~ port && $5 ~ ":" port "$" {print $0}' )

# resultの結果が空ではない場合
if [[ -n "${result}" ]]; then
        echo "======= ${timestamp} ======"
        echo "${target_port}番ポートは開放済みです"

        echo "============= 詳細 ==============="
        echo "${result}"

        # ログファイルへの格納
        {
                echo "======= ${timestamp} ======"
                echo "${result}"
        } >> "${output_file}"

# resultの結果が空の場合
else
        echo "${target_port}番ポートは開放されていません"

        # ログファイルへの格納
        {
                echo "======= ${timestamp} ======"
                echo "${target_port}番ポートは開放されていません"
        } >> "${output_file}"
fi
