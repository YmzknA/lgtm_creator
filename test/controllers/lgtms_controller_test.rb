require "test_helper"

class LgtmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lgtms_index_url
    assert_response :success
  end

  test "should get new" do
    get lgtms_new_url
    assert_response :success
  end

  test "should get create" do
    get lgtms_create_url
    assert_response :success
  end
end
