class Task < ApplicationRecord
  acts_as_list
  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
