class CreateTreattags < ActiveRecord::Migration
  def change
    create_table :treattags do |t|
      t.references :treat, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
