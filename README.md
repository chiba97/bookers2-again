# 『ANI-CLE』

<img width="1440" alt="パソコンサイズ表示画面" src="https://user-images.githubusercontent.com/88390294/143163883-d500d031-1f80-43eb-a728-895e87a9de1e.png">

<img width="344" alt="スマートフォンサイズ表示画像" src="https://user-images.githubusercontent.com/88390294/143186627-0e852363-47e1-4261-bbb0-9ffc219ea141.png">　　　<img width="409" alt="タブレットサイズ表示画像" src="https://user-images.githubusercontent.com/88390294/143186979-01204063-7bb2-4585-9bf2-fd55c5b93299.png">

## 概要
「ペットと共に人生を歩んでいる人に向けたサイト」
ペットを大切に思う人たちによるペットの為の輪を広げたいという思いがあり、 "animal-circle"からとりまして、サイト名を"ANI-CLE"と名付けました。 自分のペットの自慢話や飼育情報等を自由に投稿し合ったりすることでペットを大切にしている者同士が繋がり、 情報交換のできる場にもなるサイトです。

## URL
https://ani-cle.com

【テスト会員アカウント】
* メールアドレス： user@gmail.com
* パスワード： 111111<br>
【テスト管理者アカウント】
* メールアドレス： admin@gmail.com
* パスワード： 111111<br>
【ゲストログイン】
* ゲストログインボタンからテストユーザーとして簡単にログインできます。

## 制作の背景
私は実家で初めて犬を飼いだしてから、自分の飼っている犬にはもちろん他の方が飼っている動物に対しても凄く興味が湧きました。
ペットを大切に飼う者なら誰しも、自分のペットを自慢したい気持ちがあったり、動物好きだと思うので、飼っているペットを機に繋がったり、情報交換のできる場があったらいいなと思いこのテーマを選びました。

## 主な利用シーン
* 自分の飼っているペットを自慢したい時
* ペットを飼っている者同士で繋がり、情報交換をしたいと考えている時
* 自分のペットの成長記録を投稿したい時
* 他のユーザーの飼っているペットを見て癒されたい時

## 機能一覧
* ログイン機能（会員・管理者）
  - 日本語化（devise-i18n）
  - ゲストログイン
* 管理者機能
  - 会員退会機能（論理削除）
* 投稿機能（CRUD）
  - 画像投稿（refile,refile-mini_magick）
  - いいね機能（Ajax）
  - コメント機能（Ajax）
  - SNS共有機能（social-share-button）
  - PV数計測機能（impressionist）
* 通知機能 
  - 自分の投稿した記事がお気に入り登録された時、フォローされた時、相互フォロー関係にあるユーザーからDMが送られたとき、自分がコメントした投稿にコメントが投稿されたときに通知が入ります。
  - 通知が入った際に、通知一覧リンクにマークが付く
* DM機能 
  - 相互関係にあるユーザー同士はDMチャットが可能
* 検索機能
  - ログイン前（投稿記事をキーワードから検索可）
  - 会員ログイン後（ユーザー・投稿記事をキーワードから検索可）
  - 管理者ログイン後（ユーザーをキーワードから検索可）
* フォロー機能 
* お問い合わせ機能(Action Mailer)
  - ユーザーから問い合わせを受け取り、管理者よりお問い合わせ内容の確認とユーザーの登録メールアドレスに返信可能
* ページネーション機能（kaminari）
  - 投稿・フォロー・フォロワー・お気に入り・会員・お問い合わせ等の一覧ページに実装
* ソート機能
　　 - 投稿一覧ページをお気に入りの多い順・投稿日時の新しい順に並び替え可能
* レスポンシブデザイン
  - タブレット（width-768以下）
  - スマートフォン（width-414-375-320以下）
* コード解析（Rubocop）
* N＋１問題（bullet）

詳細は下記よりご確認ください。
* [機能詳細](https://docs.google.com/spreadsheets/d/1LbGVL06nWAO9izmFYdmhg0EM_rQjFq1YAbzYYbgV_I8/edit?usp=sharing)

## ER図

<img width="779" alt="スクリーンショット 2021-11-24 11 56 57" src="https://user-images.githubusercontent.com/88390294/143163850-36f05ed5-3ff3-4221-ba24-de14d70daed2.png">

### その他設計図
* [画面遷移図](https://drive.google.com/file/d/1sfJhcJPOFZLujdjkCWaLLuEKNDAoziW4/view?usp=sharing)
* [テーブル定義書](https://docs.google.com/spreadsheets/d/1VUUy4AjLwR3eZ5YZ91Y1tatjix_wty2iFpsmh_4BxT8/edit?usp=sharing)
* [詳細設計](https://docs.google.com/spreadsheets/d/1K721vfDDCjR2Yf8OEywzR8lVk8aEUcr2iLVZeSEw1UM/edit?usp=sharing)

## 環境・使用技術
### フロントエンド
* Bootstrap 4.5.0
* JavaScript、jQuery、Ajax

### バックエンド
* Ruby 2.6.3
* Rails 5.2.5

### 開発環境
* OS：Linux(CentOS)
* 言語：HTML,CSS,JavaScript,Ruby,SQL
* フレームワーク：Ruby on Rails
* JSライブラリ：jQuery
* IDE：Cloud9

### 本番環境
* AWS (EC2、RDS for MySQL、Route53)
* Nginx、 Puma

### 使用素材
* [O-DAN](https://o-dan.net/ja/)

### インフラ構成図

<img width="702" alt="インフラ構成図画像" src="https://user-images.githubusercontent.com/88390294/143188871-0e91f796-5dc0-490d-ac7e-41be73b68d8f.png">

### テスト
* Rspec (単体／結合）一部 項目数：計250以上

### その他使用技術
* 非同期通信 (お気に入り登録、いいね、DM)
* Action Mailer
* Rubocop-airbnb
* HTTPS接続 (Certbot)
* N＋１問題（bullet）
