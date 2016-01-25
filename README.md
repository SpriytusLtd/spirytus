# spirytus 呑兵衛土佐巡
[![Circle CI](https://circleci.com/gh/SpriytusLtd/spirytus.svg?style=svg)](https://circleci.com/gh/SpriytusLtd/spirytus)

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

2. このリポジトリをクローンし、そのクローンしたディレクトリに入ります。
  ```
  $ git clone https://github.com/SpriytusLtd/spirytus.git
  $ cd spirytus
  ```

3. データベースにアクセスするためのユーザ名とパスワードを環境変数に登録します。
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
 - CentOSの場合以下の手順が必要です。

   ```
   $ sudo yum install mysql-devel
   $ gem install mysql2 -v '0.3.20'
   $ bundle install
   ```
 - さらに以下のコマンドで実行します。

   ```
   $ rails s -b 0.0.0.0
   ```
