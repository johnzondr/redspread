class AddCrnArrayToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :crn, :text
  end
end
