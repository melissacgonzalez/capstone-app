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

      t.timestamps
    end
  end
end
