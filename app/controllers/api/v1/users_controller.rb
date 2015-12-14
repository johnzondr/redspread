class Api::V1::UsersController < ApiController
	def create
		device_id = params[:uuid]

		#check if user's device exist
		@user = User.find_by(device_id: device_id)

		# if @
		
		@user = User.new
		@user.save
	end
end
