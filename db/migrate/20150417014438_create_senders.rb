class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.string :phone_no_cc
      t.string :phone_with_cc
      t.timestamps null: false
    end
  end
end
