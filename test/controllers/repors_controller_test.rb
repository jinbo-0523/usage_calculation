require 'test_helper'

class ReporsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get repors_index_url
    assert_response :success
  end

  test "should get new" do
    get repors_new_url
    assert_response :success
  end

  test "should get create" do
    get repors_create_url
    assert_response :success
  end

  test "should get show" do
    get repors_show_url
    assert_response :success
  end

  test "should get edit" do
    get repors_edit_url
    assert_response :success
  end

  test "should get update" do
    get repors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get repors_destroy_url
    assert_response :success
  end

end
