class Accent < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :atamadakas, dependent: :destroy
  has_many :nakadakas, dependent: :destroy
  has_many :odakas, dependent: :destroy
  has_many :heibans, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :part_of_speech
  belongs_to :accent_pattern
  belongs_to :beat_count

  # アクセント登録時のバリデーション
  with_options presence: true do
    validates :info, length: { maximum: 400 }

    with_options length: { maximum: 20 } do
      validates :word, uniqueness: { case_sensitive: false }
      validates :word_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナを入力してください' }
    end
  end
  
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :part_of_speech_id
    validates :accent_pattern_id
  end

  # searchアクションの定義
  def self.search(search)
    Accent.where('word LIKE(?)', "#{search}%") if search != ''
  end
end
