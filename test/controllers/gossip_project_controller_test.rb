require "test_helper"

class GossipProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get gossip_project_home_url
    assert_response :success
  end
end
