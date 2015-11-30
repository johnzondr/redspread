require 'parse'

class Api::V1::OcrController < ApiController
	def post
		parse_url = params[:parse_url]
		@courses = parse(parse_url)
	end

	def index
		render json: '{yes:no}'
	end

end
