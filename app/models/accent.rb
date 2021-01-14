class Accent < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :part_of_speech
  belong_to :accent_pattern
  belong_to :beat_count

  with_options presence: true do
    validates :info, length: { maximum: 400 } 

    with_options length: { maximum: 20 } do
      validates :word
      validates :word_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    end

    with_options numericality: { other_than: 1, messages: "can't be blank"} do
      validates :part_of_speech_id
      validates :accent_pattern_id
    end
  end
end
