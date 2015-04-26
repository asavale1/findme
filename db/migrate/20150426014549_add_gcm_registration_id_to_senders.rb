class AddGcmRegistrationIdToSenders < ActiveRecord::Migration
  def change
    add_column :senders, :gcm_registration_id, :text
  end
end
