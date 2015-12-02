class RemoveStartTime < ActiveRecord::Migration
  def change
  	remove_column :courses, :start_time
  end
end
