class Api::V1::UsersController < ApiController
	def create
		@user = User.new
		@user.save
		
	end
end
