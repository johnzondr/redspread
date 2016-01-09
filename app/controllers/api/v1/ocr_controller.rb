require 'parse'

class Api::V1::OcrController < ApiController
	def post
		task_id = params[:task_id]
		current_user = User.find_by(token: params[:token])
		# p tasks
		# p task_id.class
		url = nil
		while ! url do
			tasks = get_task_list
			if tasks
				url = find_url(tasks, task_id)
			end
			sleep(1)
		
		end
		@courses = Ocr.parse(url)

			if @courses.any?
				p "yes"
				p @courses
				current_user.register(@courses)
				render "post"
				return
			end
		render nothing: true

	end

	def index
		render json: '{yes:no}'
	end

	def destroy
		current_user = User.find(params[:user_id])
		current_user.courses.delete_all
		render nothing: true
	end



	private

	def get_task_list
		response = HTTParty.get('https://cloud.ocrsdk.com/listFinishedTasks',
			:headers => { "Authorization" => "Basic S2VlcCBVcCBBcHA6R293MVVLcW1XL0FNSXRkZ0Q0SWhHMTVJIA=="})
		if response.parsed_response.first && response.parsed_response.first[1] 
			response.parsed_response.first[1]["task"]
		else
			return nil
		end
	end


	def find_url(tasks, task_id)
		url = nil
		tasks.each do |task|
			if task["id"] == task_id
				url = task["resultUrl"]
				return url
			end
		end
		return url
	end

end
