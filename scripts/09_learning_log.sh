#!/bin/bash

# ファイルの定義
script_path=$( realpath "${0}" )
base_dir=$( dirname "${script_path}" )
log_dir="${base_dir}/study_dir"
file_month=$( date '+%Y%m' )
log_file="${log_dir}/study_log_${file_month}.log"
log_file_name="study_log_${file_month}.log"
timestamp=$( date '+%Y/%m/%d %H:%M:%S')

# ログ保存用のディレクトリを作成(初回のみ)
mkdir -p "${log_dir}"

# ログファイルの作成(月単位)
if [[ ! -f "${log_file}" ]]; then
        touch "${log_file}"
fi

# 引数の値をチェック
if [[ "${#}" -eq 0 ]]; then
        # 通常の記録するモードへ
        :
elif [[ "${1}" == "--view" || "${1}" == "-v" ]]; then
        # 閲覧モードで実行する
        read -e -p "${log_file_name} を閲覧しますか？(yes/no) " answer
        if [[ "${answer}" == "yes" || "${answer}" == "y" ]]; then
                less "${log_file}"
                exit 0
        elif [[ "${answer}" == "no" || "${answer}" == "n" ]]; then
                echo "スクリプトを終了します"
                exit 0
        else
                echo "不明な解答です。処理を終了します"
                exit 1
        fi
else
        # 引数の数が多いもしくは、適切ではない時
        echo "====================  ERROR  =========================="
        echo "学習内容を記録する場合は、引数なしで実行して下さい"
        echo "最新のログを閲覧したい場合は、-v,--viewを指定して下さい"
        echo "======================================================="
        exit 1
fi

# 学習内容を標準入力から受け取る
echo "====== ${timestamp} ======"
read -e -p "# 今日の学習内容: " study_content
read -e -p "# 気づき/メモ: " memo

# 学習内容をログファイルに格納
{
        echo "====== ${timestamp} ======"
        echo "${study_content}"
        echo "${memo}"
        echo "================================="
        echo ""
} >> "${log_file}"

echo "学習内容を保存しました"
echo "${log_file}"