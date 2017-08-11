class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :datetime
      t.text :description
      t.string :event_type
      t.string :distance
      t.integer :sport_id
      t.integer :location_id
      t.string :main_image
      t.string :image2
      t.string :image3
      t.string :image4

      t.timestamps
    end
  end
end
