class Heiban < ApplicationRecord
  belongs_to :user
  belongs_to :accent

  validates_uniqueness_of :accent_id, scope: :user_id
end
