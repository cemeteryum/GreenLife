class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :cat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
