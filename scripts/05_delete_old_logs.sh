#!/bin/bash

# set -x

# 変数の定義
default_dir="/var/log/old/"

# メニューの表示
echo "メニュー"
echo "========================="
echo "1) ディレクトリの容量を確認"
echo "2) 任意の期間をもとにファイルを削除する"
echo "q) 終了"
echo "========================="
read -p "選択して下さい (1/2/q): " menu


# case文
case "${menu}" in
  1)
        # ディレクトリを確認
        read -p "1)ディレクトリを入力してください: (デフォルト: ${default_dir}) " target_dir
        target_dir="${target_dir:-${default_dir}}"

        # target_dirのディレクトリの存在しない時
        if [[ ! -d "${target_dir}" ]]; then
                echo "ディレクトリが存在しません。"
                exit 1
        else
                du -sh "${target_dir}"
        fi
        ;;

  2)
        # 何日前のファイルを削除するか決める
        read -p "2)対象期間を入力してください: (デフォルト:7) " retention_day
        retention_day="${retention_day:-7}"

        # ディレクトリを確認
        read -p "2)ディレクトリを入力してください: (デフォルト: ${default_dir}) " target_dir
        target_dir="${target_dir:-${default_dir}}"

        # target_dirのディレクトリの存在しない時
        if [[ ! -d "${target_dir}" ]]; then
                echo "ディレクトリが存在しません。"
                exit 1
        fi

        # ファイルの削除を行う
        read -p "${target_dir}内の${retention_day}日以上前のファイルを削除します。(yes/no): " answer

        if [[ "${answer}" == "yes" || "${answer}" == "y" ]]; then
                find "${target_dir}" -type f -mtime +"${retention_day}" -print -delete
                echo "対象ファイルを削除しました。"
        else
                echo "処理を中断します。"
        fi
        ;;

  q)
        # 終了する
        echo "終了します。"
        ;;

  *)
        echo "正しい入力をしてください 1/2/q "
        ;;
esac
