require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  fixtures :categories
  setup do
    @user = users(:me)
    sign_in @user
  end

  # test "should be able to create category from dashboard" do
  #   get dashboard_path
  #   assert_difference("Category.count", 1) do
  #     post categories_path, params: { category: { title: "whattttttttttttt" } }
  #   end
  #   assert_response :found
  # end

  test "should be able to get edit path" do
    cat = categories(:one)
    get edit_category_path(cat.id)
    assert_response :success
  end

  test "should be able to update category title" do
    cat = categories(:one)
    patch category_path(cat.id)
    cat.update(title: "heh")
    assert_equal "heh", cat.title
  end

  test "should be delete a category from dashboard" do
    cat = categories(:one)
    get dashboard_path
    assert_difference("Category.count", -1) do
      delete category_path(cat.id)
    end
    assert_response :found
  end
end
