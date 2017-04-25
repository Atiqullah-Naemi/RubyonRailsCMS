require 'test_helper'

class Admin::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_home_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_home_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_home_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_home_update_url
    assert_response :success
  end

end
