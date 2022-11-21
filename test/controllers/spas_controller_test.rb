require "test_helper"

class SpasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spas_index_url
    assert_response :success
  end

  test "should get show" do
    get spas_show_url
    assert_response :success
  end

  test "should get new" do
    get spas_new_url
    assert_response :success
  end

  test "should get create" do
    get spas_create_url
    assert_response :success
  end

  test "should get edit" do
    get spas_edit_url
    assert_response :success
  end

  test "should get update" do
    get spas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get spas_destroy_url
    assert_response :success
  end
end
