class BooleanCourseDays < ActiveRecord::Migration
  def change
  	add_column :courses, :monday, :boolean, null: false, default: false
  	add_column :courses, :tuesday, :boolean, null: false, default: false
  	add_column :courses, :wednesday, :boolean, null: false, default: false
  	add_column :courses, :thursday, :boolean, null: false, default: false
  	add_column :courses, :friday, :boolean, null: false, default: false
  end
end
