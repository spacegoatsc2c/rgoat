class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :realm
      t.integer :ilvl
      t.string :class_name
      t.string :portrait

      t.timestamps
    end
  end
end
