require 'parse'

class Api::V1::OcrController < ApiController
	def post
		task_id = params[:task_id]
		response = HTTParty.get('https://cloud.ocrsdk.com/listFinishedTasks',
			:headers => { "Authorization" => "Basic S2VlcCBVcCBBcHA6R293MVVLcW1XL0FNSXRkZ0Q0SWhHMTVJIA=="})
		
		# @courses = parse(parse_url)
		p response
		render json: '{yes:no}'

	end

	def index
		render json: '{yes:no}'
	end

end
