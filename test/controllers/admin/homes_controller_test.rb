require 'test_helper'

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_homes_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_homes_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_homes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_homes_update_url
    assert_response :success
  end

end
