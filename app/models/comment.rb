class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :accent

  validates :comment, presence: true, length: { maximum: 200 }
end
