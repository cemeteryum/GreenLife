class CreateChallikes < ActiveRecord::Migration
  def change
    create_table :challikes do |t|
      t.boolean :like
      t.references :user, index: true, foreign_key: true
      t.references :chal, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
