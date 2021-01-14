class Accent < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :part_of_speech
  belong_to :accent_pattern
  belong_to :beat_count

  with_options presence: true do
    validates :word
    validates :word_kana
    
    with_options numericality: { other_than: 1, messages: "can't be blank"} do
      validates :part_of_speech_id
      validates :accent_pattern_id
    end
  end
end
