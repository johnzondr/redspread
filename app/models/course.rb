require 'roo'

class Course < ActiveRecord::Base
	has_many :course_memberships
	has_many :users, :through => :course_memberships



#{Rails.root}/lib/prod.pem

	
	def self.update_course_catalog(file)
		catalog = Roo::Spreadsheet.open(file)
		(2..catalog.last_row).each do |i|
			entry = catalog.row(i)
			course = find_by(course_registration_number: entry[3]) || new
			course.name = entry[0]
			course.department = entry[1]
			course.course_number = entry[2].floor
			course.course_registration_number = entry[3]
			course.room = entry[4].floor
			course.building = entry[5]
			course.start_time = entry[6]
			day_ary = entry[7].split(//)
			(course.monday = true) if day_ary.include?("M")
			(course.tuesday = true) if day_ary.include?("T")
			(course.wednesday = true) if day_ary.include?("W")
			(course.thursday = true) if day_ary.include?("R")
			(course.friday = true) if day_ary.include?("F")
			course.save
		end
	end

	def self.update_default
		update_course_catalog("#{Rails.root}/lib/course_catalog.xlsx")
	end

end
