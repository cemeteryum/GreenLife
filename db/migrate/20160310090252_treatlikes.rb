class Treatlikes < ActiveRecord::Migration
  def change
     create_table :treatlikes do |t|
      t.boolean :like
      t.references :user, index: true, foreign_key: true
      t.references :treat, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
