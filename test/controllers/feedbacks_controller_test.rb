require "test_helper"

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get feedbacks_new_url
    assert_response :success
  end
end
