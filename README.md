# spirytus 呑兵衛土佐巡

## 説明
ソフトウェア工学のチーム「Spirytus」が開発するWebアプリケーション、
呑兵衛土佐巡のリポジトリです。

## 呑兵衛土佐巡とは？？？
高知県民と観光客を対象に、高知のお酒や居酒屋を紹介することを
目的としたWebアプリケーションです。
お酒と居酒屋に焦点を絞った某「食べ◯グ」的なものを目指します。

## 開発環境など
### フレームワーク
* Ruby on rails 4.2（Ruby 2.2）
* JQuery
* BootStrap

### データベース
* MySQL ver.5.6

### gemなど
* Devise
* RSpec

## 開発を始める方法
1. 環境を構築します。次のものは必須です。
  1. Ruby 2.2
  2. Ruby on Rails 4.2
  3. MySQL 5.6

2. このリポジトリをクローンし、
そのクローンしたディレクトリに入ります。
```
$ git clone https://github.com/SpriytusLtd/spirytus.git
$ cd spirytus
```

3. データベースにアクセスするためのユーザ名とパスワードを
環境変数に登録します。
```
$ export SPIRYTUS_DATABASE_USERNAME=ユーザ名
$ export SPIRYTUS_DATABASE_PASSWORD=パスワード
```

4. データベースを作成し、マイグレートします。
```
$ rake db:create
$ rake db:migrate
```

5. アプリケーションが実行できればたぶんおkです。
```
$ rails s
```
