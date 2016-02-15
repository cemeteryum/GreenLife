class CreateArttags < ActiveRecord::Migration
  def change
    create_table :arttags do |t|
      t.references :art, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
