# Shell Script Portfolio

このリポジトリは、日常的なタスクを自動化するための10個のシェルスクリプトを収録しています。各スクリプトは、システム管理やネットワーク監視など、実務で役立つユースケースを想定しています。

## スクリプト一覧

1. **01_error_log_extractor.sh**  
   ログファイルから「ERROR」行を抽出し、別ファイルに保存します。

2. **02_directory_backup.sh**  
   指定したディレクトリを日付付きでバックアップします。

3. **03_system_report.sh**  
   CPU、メモリ、ディスクの使用状況をまとめたレポートを出力します。

4. **04_bulk_rename.sh**  
   指定ディレクトリ内のファイル名を一括でリネームします。

5. **05_old_log_cleaner.sh**  
   指定期間(デフォルト:7日)以上前のログファイルを削除します。

6. **06_boot_log_summary.sh**  
   Linuxサーバーの起動ログを要約して表示します。

7. **07_file_size_checker.sh**  
   ファイルサイズをチェックし、上限を超えた場合に警告を出します。

8. **08_process_monitor.sh**  
   指定したプロセスが稼働しているかを監視します。

9. **09_study_progress_logger.sh**  
   学習進捗を記録するためのノートを作成します。

10. **10_port_checker.sh**  
    指定したポートが開放されているかをチェックします。

## 使用方法

各スクリプトは、実行権限を付与した上で実行してください。

```bash
# スクリプトに実行権限を付与
chmod +x script_name.sh
# もしくは
chmod 755 script_name.sh

# 実行
./script_name.sh
```

## 動作環境

**OS**  
 - AlmaLinux release 9.5 (Teal Serval)

 **Shell**  
 - Bash 5.1.8

**仮想環境**  
- VirtualBox 7.0.8  
