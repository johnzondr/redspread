class AddCourseDaysAsBoolean < ActiveRecord::Migration
  def change
	add_column :courses, :monday, :boolean
  	add_column :courses, :tuesday, :boolean
  	add_column :courses, :wednesday, :boolean
  	add_column :courses, :thursday, :boolean
  	add_column :courses, :friday, :boolean
  end
end
