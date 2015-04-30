class AddGcmRegistrationIdToSenders < ActiveRecord::Migration
  def change
    add_column :senders, :gcm_regid, :text
  end
end
