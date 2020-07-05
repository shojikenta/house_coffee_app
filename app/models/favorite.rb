class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :drink
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :drink_id, presence: true
end
