class User < ActiveRecord::Base
	has_many :course_memberships
	has_many :courses, :through => :course_memberships


	def register(crn_ary)
		crn_ary.each do |crn|
			course_id = Course.where(course_registration_number: crn).take.id
			CourseMembership.create(user_id: self.id, course_id: course_id)
		end
	end

	def monday
		schedule = self.courses.where(monday: true)
	end

	def tuesday
		schedule = self.courses.where(tuesday: true)
	end
	def wednesday
		schedule = self.courses.where(wednesday: true)
	end
	def thursday
		schedule = self.courses.where(thursday: true)
	end
	def friday
		schedule = self.courses.where(friday: true)
	end
end
