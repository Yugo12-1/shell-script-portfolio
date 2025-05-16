#!/bin/bash

# set -x

# プロセス名を受け取る
read -p "監視するプロセス名を入力して下さい: " input_process

# プロセスIDのリストを作成
# 稼働していない場合は、リストの中身が空になる
pid_lists=( $( pgrep -x "${input_process}" ) )

# 親プロセスのPIDを取得(pid_listsの最初の要素を参照)
input_process_ppid="${pid_lists[0]}"

if (( "${#pid_lists[@]}" != 0 )); then
        echo "=============== プロセス情報 ==============="
        echo "プロセス:${input_process} は稼働中です"

        # プロセスの詳細情報
        echo "=============== サマリー情報 ==============="
        grep -E "Name|State|Tgid|Pid|PPid|VmRSS|VmSize|Threads" /proc/"${input_process_ppid}"/status
        echo "============================================"
else
        echo "プロセス:${input_process} が見つかりません"
fi