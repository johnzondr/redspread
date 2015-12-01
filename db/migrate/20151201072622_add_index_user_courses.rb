class AddIndexUserCourses < ActiveRecord::Migration
  def change
  	    add_index :course_memberships, [:user_id, :course_id]
  end
end
