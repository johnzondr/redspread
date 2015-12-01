class AddDaysAsBinary < ActiveRecord::Migration
  def change
  	add_column :courses, :monday, :binary
  	add_column :courses, :tuesday, :binary
  	add_column :courses, :wednesday, :binary
  	add_column :courses, :thursday, :binary
  	add_column :courses, :friday, :binary

  end
end
