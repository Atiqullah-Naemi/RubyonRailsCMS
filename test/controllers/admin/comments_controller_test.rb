require 'test_helper'

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_comments_index_url
    assert_response :success
  end

  test "should get update" do
    get admin_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_comments_destroy_url
    assert_response :success
  end

end
