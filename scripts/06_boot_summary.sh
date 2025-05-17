#!/bin/bash

# set -x

echo "======サーバーの起動ログサマリ======="
echo "起動時刻: $( uptime -s )"
echo "====================================="

# error以上のエラーログを確認
echo "起動以降のエラー: "
journalctl -p 3 -b | tail -n 20
echo "====================================="

# 起動に失敗したサービス
echo "起動失敗したサービス:"
result=$( systemctl list-units --state=failed --no-pager)

# 起動に失敗したサービスが存在する場合は、詳細を確認する
if echo "${result}" | grep -q "fail" ; then
        echo "${result}" | awk 'NR>1 && /fail/ {print $2}' | while read unit
        do
                echo "===${unit}==="
                systemctl status "${unit}" --no-pager
                echo "============="
        done
else
        echo "起動に失敗したサービスはありません"
fi
echo "====================================="
