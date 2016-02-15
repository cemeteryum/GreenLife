class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.references :chal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
