require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  fixtures :categories
  fixtures :users
  fixtures :tasks

  setup do
    @user = users(:me)
    sign_in @user
  end
    # test for checking if tasks belongs to a user
    # assert_equal @user.id, tasks(:tasky).user_id

  test "should be able to get create path" do
    get dashboard_path
    assert_difference("Task.count", 1) do
    post category_tasks_path, params: { tasks: { task_title: tasks(:tasky).task_title, task_body: tasks(:tasky).task_body, category_id: tasks(:tasky).category.id } }
    end
    # assert_response :found
    assert_response :success
  end
end
