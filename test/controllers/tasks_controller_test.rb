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
    post category_tasks_path(categories(:one).id), params: { task: { task_title: tasks(:tasky).task_title, task_body: tasks(:tasky).task_body, user_id: tasks(:tasky).user_id } }
    end
    assert_response :found
  end

    test "should be able to get edit path" do
    cat = categories(:one)
    get edit_category_task_path(cat.id, tasks(:tasky).id)
    assert_response :success
  end

  test "should be able to update task title" do
    cat = categories(:one)
    tsk = tasks(:tasky)
    patch category_task_path(cat.id, tsk.id)
    tsk.update(task_title: "heh")
    assert_equal "heh", tsk.task_title
  end

  test "should be delete a task from dashboard" do
    cat = categories(:one)
    tsk = tasks(:tasky)
    get dashboard_path
    assert_difference("Task.count", -1) do
      delete category_task_path(cat.id, tsk.id)
    end
    assert_response :found
  end
end
