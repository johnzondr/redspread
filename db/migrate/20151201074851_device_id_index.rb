class DeviceIdIndex < ActiveRecord::Migration
  def change
  	add_index :users, :device_id
  end
end
