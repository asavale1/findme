class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.integer :phone_number

      t.timestamps null: false
    end
  end
end
