# Accent辞典

## アプリケーションの概要
>日本語アクセントの検索、及び登録ができる

## URL
https://japanese-accent-app.herokuapp.com/

## テスト用アカウント
### ログインEメールとパスワード
>Eメール: hosaka@sotaro  
>パスワード: aaaaaa

### Basic認証のIDとパスワード
>ID: accent  
>password: 0210  

## 利用方法
>知りたいアクセントの単語をフォームに入力すると検索できます。また、アクセントが未登録の単語はユーザー側が登録することもできます。

## 目指した課題解決
>言葉を仕事にする人に、手軽にかつカスタマイズしやすいアクセント辞書を提供しようと考え、このアプリを作成しました。  
昨今、サブカルチャーの普及により役者や声優の方、またその職に就こうとされる方が増えました。ただ、言葉を扱うメディアに置いては標準アクセントでなくてはいけない（ローカル放送やキャラクター性は除いて）というルールがあります。そこで誰しも手に取るのがNHK放送文化研究所もしくは三省堂出版社が出版されているアクセント辞書になります。この２社の辞書の収録語数は７万以上に上ります。ですが、この紙媒体の辞書の難点は、１つに持ち運びがしづらいこと。２つ目に辞書の編纂に時間がかかるということです。  
しかし、ネット上の辞書なら手軽に検索でき、新しい言葉もすぐに登録できます。  
以上の2点の問題解決を根幹に作成したのが、このアプリケーションとなります。

## 要件定義
### 機能


## テーブル設計

### users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :accents
- has_many :comments

### accents テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| word              | string     | null: false                    |
| word_kana         | string     | null: false                    |
| part_of_speech_id | integer    | null: false                    |
| accent_pattern_id | integer    | null: false                    |
| beat_id           | integer    |                                |
| info              | text       | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_many :comments

### comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| accent       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :accent