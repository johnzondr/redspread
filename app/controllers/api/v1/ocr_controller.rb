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
		while ! url do
			url = find_url(tasks)
			sleep(1)
		
		end
		@courses = Ocr.parse(url)

	end

	def index
		render json: '{yes:no}'
	end


	private

	def find_url(tasks)
		url = nil
		tasks.each do |task|
				url = task["resultUrl"]
		end
		return url
	end
		
	

end
