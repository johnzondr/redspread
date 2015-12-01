class RemoveDeviceIdId < ActiveRecord::Migration
  def change
  	remove_column :users, :device_id_id
  end
end
