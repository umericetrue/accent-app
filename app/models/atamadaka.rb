class Atamadaka < ApplicationRecord
  belongs_to :accent, counter_cache: :atamadakas_count
  belongs_to :user
end
