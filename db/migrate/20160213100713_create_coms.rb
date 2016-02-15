class CreateComs < ActiveRecord::Migration
  def change
    create_table :coms do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.references :art, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
