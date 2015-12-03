class User < ActiveRecord::Base
	has_many :course_memberships
	has_many :courses, :through => :course_memberships


	def register(crn_ary)
		crn_ary.each do |crn|
			course= Course.where(course_registration_number: crn).take
			if course
				course_id = course.id
				CourseMembership.create(user_id: self.id, course_id: course_id)
			end
		end
	end

	def schedule_for(day)
		case day
		when "1"
			schedule = self.courses.where(monday: true)
		when "2"
			schedule = self.courses.where(tuesday: true)
		when "3"
			schedule = self.courses.where(wednesday: true)
		when "4"
			schedule = self.courses.where(thursday: true)
		when "5"
			schedule = self.courses.where(friday: true)
		end	
	end
end
