class Drink < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) } 
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 140 }
  validates :tips, length: { maximum: 50 }
  validates :made_memo, length: { maximum: 200 }
end
