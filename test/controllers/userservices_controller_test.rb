require 'test_helper'

class UserservicesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userservices_new_url
    assert_response :success
  end

  test "should get create" do
    get userservices_create_url
    assert_response :success
  end

  test "should get update" do
    get userservices_update_url
    assert_response :success
  end

  test "should get show" do
    get userservices_show_url
    assert_response :success
  end

  test "should get destroy" do
    get userservices_destroy_url
    assert_response :success
  end

end
