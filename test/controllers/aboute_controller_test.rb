require 'test_helper'

class AbouteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aboute_index_url
    assert_response :success
  end

end
