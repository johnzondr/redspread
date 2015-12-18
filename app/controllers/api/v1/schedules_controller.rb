class Api::V1::SchedulesController < ApplicationController

	def index
		current_user = User.find_by_token(params[:token])
		day = params[:day].to_s
		@schedule = current_user.schedule_for(day)
	end
end
