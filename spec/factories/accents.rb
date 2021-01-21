FactoryBot.define do
  factory :accent do
    word {Faker::Lorem.characters(number: 10)}
    word_kana {"テスト"}
    part_of_speech_id { 2 }
    accent_pattern_id { 2 }
    beat_count_id { 2 }
    info {Faker::Lorem.sentence}
    association :user
  end
end