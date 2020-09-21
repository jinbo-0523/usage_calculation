require 'test_helper'

class CampaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campanies_index_url
    assert_response :success
  end

  test "should get new" do
    get campanies_new_url
    assert_response :success
  end

  test "should get create" do
    get campanies_create_url
    assert_response :success
  end

  test "should get edit" do
    get campanies_edit_url
    assert_response :success
  end

  test "should get update" do
    get campanies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get campanies_destroy_url
    assert_response :success
  end

end
