require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:me)
    sign_in @user
  end

  test "Should get dashboard path" do
    get dashboard_path
    assert_response :success
  end
end
