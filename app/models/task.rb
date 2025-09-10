class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :task_title, presence: true
  validates :task_body, presence: true
end
