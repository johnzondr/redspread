class Api::V1::SchedulesController < ApiController

	def index
		day = params[:day].to_s
		@schedule = current_user.schedule_for(day)
	end

	def destroy
		course_id = params[:id]
		current_user.unenroll_course(course_id)
	end

	def current_user
		User.find_by_token(params[:token])
	end
end
