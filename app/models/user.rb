class User < ActiveRecord::Base
	validates :device_id, uniqueness: true
	has_secure_token
	has_many :course_memberships
	has_many :courses, :through => :course_memberships


	def register(crn_ary)
		crn_ary.each do |crn|

			course= Course.where(course_registration_number: crn.to_i).take

			#regiser the course for the user if the course exists and the user is not already reigstered for it
			if course && ( ! self.courses.include?(course))
				course_id = course.id
				CourseMembership.create(user_id: self.id, course_id: course_id)
			end
		end
	end

	def unenroll_course(course_id)
		enrollment = CourseMembership.where(user_id: self.id, course_id: course_id).take
		if enrollment
			enrollment.delete
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
