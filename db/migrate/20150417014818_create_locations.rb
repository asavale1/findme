class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :sender_id
      t.string :recipient
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
