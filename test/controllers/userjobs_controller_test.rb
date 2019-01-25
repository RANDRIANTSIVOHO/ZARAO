require 'test_helper'

class UserjobsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userjobs_new_url
    assert_response :success
  end

  test "should get create" do
    get userjobs_create_url
    assert_response :success
  end

  test "should get update" do
    get userjobs_update_url
    assert_response :success
  end

  test "should get show" do
    get userjobs_show_url
    assert_response :success
  end

  test "should get destroy" do
    get userjobs_destroy_url
    assert_response :success
  end

end
