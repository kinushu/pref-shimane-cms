# 島根県CMS バージョン2

## 島根県CMSとは？
　島根県CMSは、2008年に公開された島根県庁で使用されている、Ruby on Railsで作られた行政機関向けのCMSです。バージョン2（コードネーム Susanoo）では、JIS X 8341-3:2010に対応するためのアクセシビリティチェック機能が追加された他、Ruby 2.1.0、Ruby on Rails 4.0.2で動作するように変更されました。また、全ての機能が一新され、最新のブラウザで動作するように変更されています。

# システム構成
　島根県CMSは、CMS本体（pref-shimane-cms）とアクセシビリティチェックツール（pref-shimane-checker）の２つのシステムに別れています。アクセシビリティチェックツールでは、JIS X 8341-3:2010のAA基準に沿ってコンテンツのチェックを行うことが可能です。アクセシビリティチェックツールではWebAPIを提供し、CMS本体とhttp経由で連携し、動作します。

## お問い合わせ先
　pref-shimane-cms at netlab.jp

## 旧島根県CMS

  http://projects.netlab.jp/PrefShimaneCMS/