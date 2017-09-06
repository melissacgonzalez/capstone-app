class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :street_address
      t.string :zip
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
