class CourseMembership < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	validates :user, uniqueness: { scope: :course,
    message: "should only be registered for each class once" }
end
