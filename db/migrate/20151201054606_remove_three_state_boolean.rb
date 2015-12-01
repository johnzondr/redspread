class RemoveThreeStateBoolean < ActiveRecord::Migration
  def change
  	remove_column :courses, :monday
  	remove_column :courses, :tuesday
  	remove_column :courses, :wednesday
  	remove_column :courses, :thursday
  	remove_column :courses, :friday
  end
end
