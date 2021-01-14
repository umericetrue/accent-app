class CreateAccents < ActiveRecord::Migration[6.0]
  def change
    create_table :accents do |t|
      t.string :word,               null: false
      t.string :word_kana,          null: false
      t.integer :part_of_speech_id, null: false
      t.integer :accent_pattern_id, null: false
      t.integer :beat_count_id
      t.text :info,                 null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
