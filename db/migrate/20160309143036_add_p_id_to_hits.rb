class AddPIdToHits < ActiveRecord::Migration
  def change
    add_column :hits, :p_id, :integer
  end
end
