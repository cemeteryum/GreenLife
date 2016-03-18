class CreateArtlikes < ActiveRecord::Migration
  def change
    create_table :artlikes do |t|
      t.boolean :like
      t.references :user, index: true, foreign_key: true
      t.references :art, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
