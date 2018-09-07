class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks do |t|
      t.references :character
      t.integer :ilvl

      t.timestamps
    end
  end
end
