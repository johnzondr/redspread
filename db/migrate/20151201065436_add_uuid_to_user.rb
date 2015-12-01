class AddUuidToUser < ActiveRecord::Migration
  def change
  	add_reference :users, :device_id, index: true, unique: true
  end
end
