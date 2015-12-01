class User < ActiveRecord::Base
	has_many :course_memberships
	has_many :courses, :through => :course_memberships
end
