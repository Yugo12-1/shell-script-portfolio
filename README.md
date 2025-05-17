# Shell Script Portfolio

## 目的

このリポジトリは、日常的なタスクを自動化するための10個のシェルスクリプトを収録しています。  
また、システム管理、プロセス監視などの実務でも役に立つようなユースケースを想定しています。

## ディレクトリ構成

```
shell-scripts-project/
 |--- scripts/
 |  |--- 01_extract_errors.sh
 |  |--- 02_backup_directory.sh
 |  |--- 03_resource_report.sh
 |  |--- 04_bulk_rename.sh
 |  |--- 05_delete_old_logs.sh
 |  |--- 06_boot_summary.sh
 |  |--- 07_check_file_size.sh
 |  |--- 08_monitor_process.sh
 |  |--- 09_learning_log.sh
 |  |--- 10_check_port.sh
 |
 |--- README.md
```

## スクリプト一覧

1. **01_extract_errors.sh**  
   ログファイルから「ERROR」行を抽出し、別ファイルに保存します。

2. **02_backup_directory.sh**  
   指定したディレクトリを日付付きでバックアップします。

3. **03_resource_report.sh**  
   CPU、メモリ、ディスクの使用状況をまとめたレポートを出力します。

4. **04_bulk_rename.sh**  
   指定ディレクトリ内のファイル名を一括でリネームします。

5. **05_delete_old_logs.sh**  
   指定期間(デフォルト:7日)以上前のログファイルを削除します。

6. **06_boot_summary.sh**  
   Linuxサーバーの起動ログを要約して表示します。

7. **07_check_file_size.sh**  
   ファイルサイズをチェックし、上限を超えた場合に警告を出します。

8. **08_monitor_process.sh**  
   指定したプロセスが稼働しているかを監視します。

9. **09_learning_log.sh**  
   学習進捗を記録するためのノートを作成します。

10. **10_check_port.sh**  
    指定したポートが開放されているかをチェックします。

## 使用方法

各スクリプトは、実行権限を付与した上で実行してください。  
※基本的には、特権ユーザー(root)での実行を想定しています。

```bash
# スクリプトに実行権限を付与
chmod +x script_name.sh
# もしくは
chmod 755 script_name.sh

# 実行
./script_name.sh
```
## テスト方法

各スクリプトは、AlmaLinux 9.5 上で動作確認を行っています。  
以下のコマンドでテストを実行できます。

```bash
# 構文エラーチェック
bash -n script_name.sh

# debug
# 以下のコメントアウトを削除する
# set -x
```

## 動作環境

**OS**  
 - AlmaLinux release 9.5 (Teal Serval)

 **Shell**  
 - Bash 5.1.8

**仮想環境**  
- VirtualBox 7.0.8  
