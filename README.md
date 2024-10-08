## 開発環境構築

### 事前準備

**以下が作業用PCにinstallされていること**

- Docker Desktop
- mkcert
- node 22.9.0

### 環境構築

1. 初期設定
```bash
make init
```

2. フロント用のviteサーバ起動
```bash
make serve
```

3. 環境構築確認
```bash
# 以下のURLに遷移して画面が表示されれば完了
https://localhost
```

### コマンド一覧

- 初期化

  ```bash
  make init
  ```

- Dockerコンテナの再ビルド

  ```bash
  make rebuild
  ```

- Dockerコンテナの再起動

  ```bash
  make restart
  ```

- Dockerコンテナの起動

  ```bash
  make up
  ```

- Dockerコンテナ・ネットワーク・ボリューム・イメージの停止

  ```bash
  make down
  ```

- migration適用

  ```bash
  make migration
  ```

- migration適用

  ```bash
  make migration
  ```

- seeder実行

  ```bash
  make migration-seed
  ```

- 全migrationの再実行

  > **Warning**<br>
  > 全てのテーブルをDropしてから全migrationを実行します。<br>
  > 削除したくないデータがある場合は退避してから実行してください。

  ```bash
  make migration-fresh
  ```