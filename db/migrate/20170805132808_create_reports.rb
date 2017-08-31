class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :registration_id
      t.integer :event_id
      t.string :title
      t.text :body
      t.integer :bib_number
      t.string :map_data
      t.string :elevation_profile
      t.integer :overall_rating
      t.integer :swag_rating
      t.integer :post_party_rating
      t.integer :packet_pickup_rating
      t.integer :race_support_rating

      t.timestamps
    end
  end
end
