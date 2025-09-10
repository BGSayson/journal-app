require "test_helper"

class TaskTest < ActiveSupport::TestCase
  fixtures :users
  fixtures :categories
  fixtures :tasks

  # test "Validates task creation" do
  #   user = users(:me)
  #   # cat = categories(:one)

  #   tusky = user.tasks.create!(task_title: tasks(:tasky).task_title, task_body: tasks(:tasky).task_body,category: tasks(:tasky).category )

  #   assert tusky.valid?, "Title and body cannot be blank"
  # end

  # test "belongs to a user" do
  #   tsk = tasks(:tasky)
  #   user = users(:me)

  #   assert tsk.valid?, "Category should belong to a user"
  #   assert_equal user, tsk.user
  # end

  # test "belongs to a category" do
  #   cat = categories(:one)
  #   tsk = tasks(:tasky)

  #   assert tsk.valid?, "Task should belong to a category"
  #   assert_equal cat, tsk.category
  # end
end
