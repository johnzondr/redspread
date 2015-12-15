class Api::V1::UsersController < ApiController
	def create
		device_id = params[:uuid]
		p device_id

		#check if user's device exist
		@user = User.find_by(device_id: device_id)

		
		if @user
			# if user exists, return user's existing token
		else
			# if user doesn't exist, create new user and return token
			@user = User.new
			@user.device_id = device_id
			@user.save

		end
		
		
	end
end
