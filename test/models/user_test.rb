require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users
  # test "Username must be at least 8 characters long" do
  #   # user = users(:one)
  #   user = User.create!(email: "testtest@test.com", password: "Testtest@123", password_confirmation: "Testtest@123", username: "testte")
  #   assert user.valid?, "Username must be at least 8 characters lang"
  # end

  test "Password complexity requirements must be met" do
    user = users(:two)
    user.password = "test"
    user.password_confirmation = "test"
    assert user.valid?, "Password complexity requirement must be met"
  end
end
