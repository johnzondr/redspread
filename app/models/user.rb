class User < ActiveRecord::Base
	has_many :course_memberships
	has_many :courses, :through => :course_memberships


	def register(crn_ary)
		crn_ary.each do |crn|
			course_id = Course.where(course_registration_number: crn).take.id
			CourseMembership.create(user_id: self.id, course_id: course_id)
		end
	end

	def schedule_for(day)
		case day
		when "m"
			schedule = self.courses.where(monday: true)
		when "t"
			schedule = self.courses.where(tuesday: true)
		when "w"
			schedule = self.courses.where(wednesday: true)
		when "r"
			schedule = self.courses.where(thursday: true)
		when "f"
			schedule = self.courses.where(friday: true)
		end	
	end
end
