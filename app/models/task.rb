class Task < ApplicationRecord
  belongs_to :user
  belongs to :category
end
