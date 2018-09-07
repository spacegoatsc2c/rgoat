class AddPositionToRanks < ActiveRecord::Migration[5.2]
  def change
    add_column :ranks, :position, :integer
  end
end
