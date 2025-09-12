require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "Should get root path" do
    get root_path
    assert_response :success
  end
end
