class CreateNakadakas < ActiveRecord::Migration[6.0]
  def change
    create_table :nakadakas do |t|
      t.references :user, foreign_key: true
      t.references :accent, foreign_key: true
      t.timestamps
    end
  end
end
