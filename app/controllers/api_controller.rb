class ApiController < ApplicationController

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :json_request?
 # skip_before_action :verify_authenticity_token
   protected

  def json_request?
    request.format.json?
  end

end