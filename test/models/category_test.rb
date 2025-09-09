require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  fixtures :categories
  fixtures :users
  # test "the truth" do
  #   assert true
  # end

  test "category creation must be validated" do
    # cat = Category.create(title: "sdrrtjrtjhrt", user_id: "1")
    cat = categories(:one)
    assert cat.valid?, "Category must have title"
  end

  test "belongs to a user" do
    cat = categories(:one)
    user = users(:me)
    assert cat.valid?, "Category should belong to a user"
    assert_equal user, cat.user
  end
end
