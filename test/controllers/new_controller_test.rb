require "test_helper"

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_index_url
    assert_response :success
  end

  test "should get show" do
    get new_show_url
    assert_response :success
  end

  test "should get delete" do
    get new_delete_url
    assert_response :success
  end
end
