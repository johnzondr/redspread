require 'parse'

class Api::V1::OcrController < ApiController
	def post
		task_id = params[:task_id]
		response = HTTParty.get('https://cloud.ocrsdk.com/listFinishedTasks',
			:headers => { "Authorization" => "Basic S2VlcCBVcCBBcHA6R293MVVLcW1XL0FNSXRkZ0Q0SWhHMTVJIA=="})
		
		# @courses = parse(parse_url)
		tasks = response.parsed_response.first[1]["task"]
		# p tasks
		# p task_id.class
		url = nil
		tasks.each do |task|
			# p task["id"]
			if task["id"] == task_id
				url = task["resultUrl"]
			end
		end
		@courses = parse(url)


	end

	def index
		render json: '{yes:no}'
	end

end
