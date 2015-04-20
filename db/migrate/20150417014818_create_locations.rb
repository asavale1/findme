class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :sender_id
      t.integer :receiver
      t.decimal :logitude
      t.decimal :latitude

      t.timestamps null: false
    end
  end
end
