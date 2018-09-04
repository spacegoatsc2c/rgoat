class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.string :link
      t.references :character
      t.references :boss

      t.timestamps
    end
  end
end
