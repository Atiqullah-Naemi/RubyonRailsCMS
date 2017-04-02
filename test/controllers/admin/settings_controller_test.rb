require 'test_helper'

class Admin::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_settings_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_settings_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_settings_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_settings_update_url
    assert_response :success
  end

end
