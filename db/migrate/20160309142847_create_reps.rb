class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.references :treat, index: true, foreign_key: true
      t.integer :p_id

      t.timestamps null: false
    end
  end
end
