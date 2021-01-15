# 環境構築手順

プロジェクト一式をダウンロードする。

```
$ git clone git@github.com:bsfuji/laradock.git
```

## ビルド&起動

ローカル開発環境を起動します。

```
$ docker-compose up -d
```

## 初回のみ

ローカル開発環境が起動している状態で以下を実行する。

```
$ sh setup.sh
```

無事完了したら `http://laravel.local` でアクセス出来るはずです。