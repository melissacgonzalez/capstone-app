class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :status
      t.string :comment

      t.timestamps
    end
  end
end
