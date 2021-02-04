class Atamadaka < ApplicationRecord
  belongs_to :accent
  belongs_to :user

  validates_uniqueness_of :accent_id, scope: :user_id
end
