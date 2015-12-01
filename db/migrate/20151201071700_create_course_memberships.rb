class CreateCourseMemberships < ActiveRecord::Migration
  def change
    create_table :course_memberships do |t|
    	t.integer :user_id, index: true
    	t.integer :course_id, index: true
      t.timestamps null: false

    end
  end
end
