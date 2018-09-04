class AddPatchToBoss < ActiveRecord::Migration[5.2]
  def change
    add_column :bosses, :patch, :string
  end
end
