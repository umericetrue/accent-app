class CreateOdakas < ActiveRecord::Migration[6.0]
  def change
    create_table :odakas do |t|
      t.references :user, foreign_key: true
      t.references :accent, foreign_key: true
      t.timestamps
    end
  end
end
