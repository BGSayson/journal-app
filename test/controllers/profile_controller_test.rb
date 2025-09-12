require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
    setup do
    @user = users(:me)
    sign_in @user
  end

  test "Should get profile path" do
    get profile_index_path
    assert_response :success
  end
end
