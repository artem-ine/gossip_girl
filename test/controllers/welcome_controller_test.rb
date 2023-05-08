require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get greet" do
    get welcome_greet_url
    assert_response :success
  end
end
