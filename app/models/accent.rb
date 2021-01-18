class Accent < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :atamadakas, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :part_of_speech
  belongs_to :accent_pattern
  belongs_to :beat_count

  with_options presence: true do
    validates :info, length: { maximum: 400 } 

    with_options length: { maximum: 20 } do
      validates :word
      validates :word_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    end

    with_options numericality: { other_than: 1, message: "can't be blank"} do
      validates :part_of_speech_id
      validates :accent_pattern_id
    end
  end

  def self.search(search)
    if search != ""
      Accent.where('word LIKE(?)', "#{search}%")
    end
  end
end
