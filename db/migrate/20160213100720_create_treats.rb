class CreateTreats < ActiveRecord::Migration
  def change
    create_table :treats do |t|
      t.string :name
      t.boolean :md
      t.text :sym
      t.text :reg
      t.references :user, index: true, foreign_key: true
      t.references :cat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
