class CreateAtamadakas < ActiveRecord::Migration[6.0]
  def change
    create_table :atamadakas do |t|
      t.references :user, foreign_key: true
      t.references :accent, foreign_key: true
      t.timestamps
    end
  end
end
