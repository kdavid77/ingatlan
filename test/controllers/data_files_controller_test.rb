require 'test_helper'

class DataFilesControllerTest < ActionController::TestCase
  test "should get uploadFile" do
    get :uploadFile
    assert_response :success
  end

end
