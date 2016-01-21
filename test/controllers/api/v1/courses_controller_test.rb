require 'test_helper'

class Api::V1::CoursesControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

end
