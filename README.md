# 島根県CMS バージョン2

## 島根県CMSとは？
　島根県CMSは、2008年に公開された島根県庁で使用されている、Ruby on Railsで作られた行政機関向けのCMSです。バージョン2（コードネーム Susanoo）では、JIS X 8341-3:2010に対応するためのアクセシビリティチェック機能が追加された他、Ruby 2.1.0、Ruby on Rails 4.0.2で動作するように変更されました。また、全ての機能が一新され、最新のブラウザで動作するように変更されています。

# システム構成
　島根県CMSは、CMS本体（pref-shimane-cms）とアクセシビリティチェックツール（pref-shimane-checker）の２つのシステムに別れています。アクセシビリティチェックツールでは、JIS X 8341-3:2010のAA基準に沿ってコンテンツのチェックを行うことが可能です。アクセシビリティチェックツールではWebAPIを提供し、CMS本体とhttp経由で連携し、動作します。

# News
島根県CMSにSQLインジェクションの脆弱性が存在することが判明しました。
この脆弱性により、情報を改竄できてしまうおそれがあります。
島根県CMS バージョン 2.0.0 をお使いの方は 2.0.1 にアップデートしてください。
最新版のソースコードを以下のサイトから入手できます。

 https://github.com/NaCl-Ltd/pref-shimane-cms

この脆弱性情報については馬場将次氏よりご提供いただきました。心より感謝申し上げます。

## お問い合わせ先
　pref-shimane-cms at netlab.jp

## 旧島根県CMS

  http://projects.netlab.jp/PrefShimaneCMS/

## Dockerでの確認方法

初期データを流し込み、動作を確認する環境を構築します。

```bash
docker-compose build
docker-compose up -d
docker-compose exec web /myapp/appinit.sh
docker-compose stop
```
起動中に以下のURLを確認する。

### 公開画面
http://localhost:3000/

### 管理画面のログイン
http://localhost:3000/susanoo/users/login

### DBを初期化する際

```bash
docker-compose rm db postgres-data
```