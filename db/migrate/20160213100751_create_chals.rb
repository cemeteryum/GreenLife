class CreateChals < ActiveRecord::Migration
  def change
    create_table :chals do |t|
      t.string :name
      t.text :reg
      t.integer :dur
      t.references :user, index: true, foreign_key: true
      t.references :cat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
