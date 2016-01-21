class Api::V1::SchedulesController < ApiController

	def index #get a user's schedule for given day
		day = params[:day].to_s 
		@schedule = current_user.schedule_for(day)

	end

	def new
		@new_enroll = current_user.course_memberships.new
		@new_enroll.course_id = params[:course_id]
		@new_enroll.save
	end


	def destroy #unenroll user from a course
		course_id = params[:id]
		current_user.unenroll_course(course_id)
	end

	private
	
	def current_user
		User.find_by_token(params[:token])
	end

	
end
