class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :accent

  validates :comment, presence: true
end
