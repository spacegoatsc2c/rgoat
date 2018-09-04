class AddLevelToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :level, :integer
  end
end
