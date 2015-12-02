class AddStartTimeSeconds < ActiveRecord::Migration
  def change
  	add_column :courses, :start_time, :integer
  end
end
