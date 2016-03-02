class AddPIdToComs < ActiveRecord::Migration
  def change
    add_column :coms, :p_id, :integer
  end
end
