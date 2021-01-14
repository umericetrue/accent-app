# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :accents
- has_many :comments

## accents テーブル

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

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| accent       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :accent