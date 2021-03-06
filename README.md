# Accent辞典

## アプリケーションの概要
日本語アクセントの検索、及び登録ができる

## URL
https://japanese-accent-app.herokuapp.com/

## テスト用アカウント
### ログインEメールとパスワード
Eメール: hosaka@sotaro  
パスワード: aaaaaa

### Basic認証のIDとパスワード
ID: accent  
password: 0210  

## 利用方法
知りたいアクセントの単語をフォームに入力すると検索できます。また、アクセントが未登録の単語はユーザー側が登録することもできます。

## 目指した課題解決
言葉を仕事にする人に、手軽にかつカスタマイズしやすいアクセント辞書を提供しようと考え、このアプリを作成しました。  
昨今、サブカルチャーの普及により役者や声優の方、またその職に就こうとされる方が増えました。ただ、言葉を扱うメディアに置いては標準アクセントでなくてはいけない（ローカル放送やキャラクター性は除いて）というルールがあります。そこで誰しも手に取るのがNHK放送文化研究所もしくは三省堂出版社が出版されているアクセント辞書になります。この２社の辞書の収録語数は７万以上に上ります。ですが、この紙媒体の辞書の難点は、１つに持ち運びがしづらいこと。２つ目に辞書の編纂に時間がかかるということです。  
しかし、ネット上の辞書なら手軽に検索でき、新しい言葉もすぐに登録できます。  
以上の2点の問題解決を根幹に作成したのが、このアプリケーションとなります。

## 要件定義
### 単語検索機能
<dl>
  <dt>目的</dt>
    <dd>調べたい単語のアクセントを検索するため。</dd>
  <dt>詳細</dt>
    <dd>検索フォームに検索したい単語を入力することで、調べたい単語がトップページ（と同じレイアウトのページ）に表示されます。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>入力フォームに検索ワードを入力して検索ボタンをクリックすることで、ページにヒットした単語が表示されます。</dd>
</dl>
   
### アクセント詳細表示機能
<dl>
  <dt>目的</dt>
    <dd>検索したアクセントの詳細を閲覧できるようにするため。</dd>
  <dt>詳細</dt>
    <dd>検索した単語の情報を確認できます。また、このページにはコメント機能があり、ログインしているユーザーはコメントすることができます。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>トップページや検索ページで調べたい単語のリンクをタップ・クリックすることで遷移してきます。ユーザーはここでアクセントの情報を入手できます。</dd>
</dl>

### アクセント登録機能
<dl>
  <dt>目的</dt>
    <dd>ユーザー側が未登録の単語を登録できるようにするため。</dd>
  <dt>詳細</dt>
    <dd>単語名・単語のフリガナ・単語の品詞・アクセントの型・アクセントの下り目・情報源の項目を入力することで登録できるようにします。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>トップページに「単語登録する」ボタンをブラウザ固定で設置します。これをタップ・クリックすることで登録ページに遷移できます。登録はそのページに必要項目を入力し、「登録する」ボタンをクリックすることでできます。登録後は登録した単語の詳細ページに遷移します。</dd>
</dl>

### アクセントの編集機能
<dl>
  <dt>目的</dt>
    <dd>自身が登録した単語の情報を編集できるようにするため。</dd>
  <dt>詳細</dt>
    <dd>誤った情報を提供してしまったり、使用頻度の高いアクセントの型が別の型に移り変わった時のために編集機能が必要になります。入力情報は登録するときと同じように情報をいれることができます。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>単語登録者にのみ、詳細ページに編集ボタンが表示されます。これをタップもしくはクリックすることで、編集ページに遷移できます。情報を入力し直して「登録する」ボタンをクリックすることで更新できます。</dd>
</dl>

### コメント機能
<dl>
  <dt>目的</dt>
    <dd>追加情報の提供及び確認できるようにするため。</dd>
  <dt>詳細</dt>
    <dd>登録された単語に対して、他のユーザーが情報を提供することができます。投稿者に加え日時も表示することで、いつのコメントかも確認できるようにしています。ただし、コメント機能を使うにはログインしている必要があります。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>ログインしているユーザーが、単語詳細ページにある入力フォームにコメントを入力し「コメントする」ボタンをクリックすると、入力した内容がページ下部に表示されます。</dd>
</dl>

### 非同期通信を利用した投票機能
<dl>
  <dt>目的</dt>
    <dd>アクセントのマジョリティを視覚的にわかりやすくするため。</dd>
  <dt>詳細</dt>
    <dd>単語の詳細ページに実装する。頭高型・中高型・尾高型・平板型と表示されているボタンをそれぞれタップやクリックすることで、カウントが１増えます。これによって、登録者以外のユーザーがどの型で使用しているかを視覚的に認識しやすくします。このとき、二つ以上の項目をクリック・タップできるが、一つの項目を複数回タップしてもカウントは１以上増えず、また、偶数回のタップはカウントが０になります。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>頭高型・中高型・尾高型・平板型と表示されているボタンをタップもしくはクリックします。</dd>
</dl>

### 単語の削除機能
<dl>
  <dt>目的</dt>
    <dd>不適切な単語の登録や、すでに同じような単語が登録されいる場合に削除するため。</dd>
  <dt>詳細</dt>
    <dd>単語を削除するとそれに付随するコメントも削除されます。そのため、この削除機能は、このアプリを管理している人にのみ可能にします。というのも、ユーザー側の都合で削除ができてしまうと、誤操作や悪意によって多くの情報を失う危険性があるためです。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>管理者でログインした時に詳細ページに削除ボタンを表示します。これをタップ・クリックすることで単語を削除できます。削除するとトップページに遷移します。</dd>
</dl>

### マイページ
<dl>
  <dt>目的</dt>
    <dd>ユーザーの使用履歴を確認できるようにするため。</dd>
  <dt>詳細</dt>
    <dd>ユーザー自身の検索履歴や、登録履歴を確認できます。そうすることで、単語の情報に追加情報を加えやすい動線を準備します。</dd>
  <dt>ストーリー（ユースケース）</dt>
    <dd>トップページと単語詳細ページヘッダー部分の自分の名前をタップ・クリックするとマイページに遷移します。</dd>
</dl>

## 機能
### 検索機能
![153e3f5ace3490746fa6ab4480575f23](https://user-images.githubusercontent.com/76139604/105475161-6d3cd680-5ce2-11eb-8b74-874e33a540f8.gif)

### 登録機能
![b7a7d53de2b7363e731ea539255f8526](https://user-images.githubusercontent.com/76139604/105476606-31a30c00-5ce4-11eb-92c3-5a38cc332d65.gif)

## 実装予定の機能
- 非同期通信を利用した投票機能
- マイページ
- レスポンシブデザイン

## テーブル設計
### ER図
![accent](https://user-images.githubusercontent.com/76139604/105478711-dde5f200-5ce6-11eb-83e5-f0eec120cd26.png)

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

## 使用技術
- ruby 2.6.5, rails 6.0.0
- webpacker(css/scss/js/jQuery)
- Rspec

ローカル環境で動作確認される際は  
bundle install  
yarn add jquery  
のコマンド入力をお願い致します。