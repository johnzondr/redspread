class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.text :name
    	t.text :department
    	t.integer :course_number
    	t.integer :course_registration_number, :index => true
    	t.text :building
    	t.text :room
    	t.time :start_time
    	t.integer :monday
    	t.integer :tuesday
    	t.integer :wednesday
    	t.integer :thursday
    	t.integer :friday


      t.timestamps null: false
    end
  end
end
