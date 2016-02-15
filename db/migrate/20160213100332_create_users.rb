class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :username, index: true, unique: true
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, default: false
      t.boolean :moderator, default: false

      t.timestamps null: false
    end
  end
end
