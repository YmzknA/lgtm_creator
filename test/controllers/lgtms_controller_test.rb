require "test_helper"

class LgtmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should post lgtm_tweet" do
    post lgtm_tweet_url, params: { lgtm: { content: "🎉", save: "0" } }, 
         headers: { "Accept" => "text/vnd.turbo-stream.html" }
    assert_response :success
  end

  test "should get autocomplete" do
    get autocomplete_lgtms_url, params: { q: "test" }, xhr: true
    assert_response :success
  end
end
