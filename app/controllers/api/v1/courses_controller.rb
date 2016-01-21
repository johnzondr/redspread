class Api::V1::CoursesController < ApiController
  def search
  	terms = params[:searchTerms]
  	@courses = Course.search(terms)
  end

	private

	def current_user
		User.find_by_token(params[:token])
	end
end
