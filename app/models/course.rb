require 'roo'

class Course < ActiveRecord::Base
	has_many :course_memberships
	has_many :users, :through => :course_memberships



#{Rails.root}/lib/prod.pem
	def self.search(terms)

		courses = Course.all

		terms.each do |term|
			if term.to_i != 0
				courses = courses.where('course_number= ? OR course_registration_number= ?', term.to_i, term.to_i)
			else
				courses = courses.where(department: term)
			end
		end

		courses

	end


	
	def self.update_course_catalog(file)
		catalog = Roo::Spreadsheet.open(file)
		(2..catalog.last_row).each do |i|
			entry = catalog.row(i)
			course = Course.new
			course.name = entry[0]
			course.department = entry[1]
			if entry[2].class == Float
				course.course_number = entry[2].floor
			end
			course.course_registration_number = entry[3]
			
			if entry[4].class == String
				course.room = entry[4]
			elsif entry[4].class == Float
				course.room = entry[4].floor
			end
		
			course.building = entry[5]
			p entry[6]			
			course.start_time = entry[6]

			if entry[7]
				day_ary = entry[7].split(//)
				(course.monday = true) if day_ary.include?("M")
				(course.tuesday = true) if day_ary.include?("T")
				(course.wednesday = true) if day_ary.include?("W")
				(course.thursday = true) if day_ary.include?("R")
				(course.friday = true) if day_ary.include?("F")
			end
			course.save
		end
	end
	def self.correct_room
		catalog = Roo::Spreadsheet.open("#{Rails.root}/lib/roomnum.xlsx")
		(2..catalog.last_row).each do |i|
			entry = catalog.row(i)
			p entry

			crn = entry[0]
			p crn

			day_ary = entry[1].split(//)
			monday = day_ary.include?("M")
			p monday
			tuesday = day_ary.include?("T")
			p tuesday
			wednesday = day_ary.include?("W")
			p wednesday
			thursday = day_ary.include?("R")
			friday = day_ary.include?("F")

			if entry[7].class == String
				room = entry[7]
			elsif entry[7].class == Float
				room = entry[7].floor
			end
			p room

			p entry[6]
			# start_time = entry[6]
			# p start_time

			course = Course.where(course_registration_number: crn, monday: monday, tuesday: tuesday, thursday: thursday, friday: friday).take
			p course
			course.room = room
			course.save
		end

	end



	def self.update_default
		update_course_catalog("#{Rails.root}/lib/course_catalog.xlsx")
	end

end
