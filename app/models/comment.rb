class Comment < ApplicationRecord
  belongs_to :drink
  validates :user_id, presence: true
  validates :drink_id, presence: true
  validates :content, presence: true, length: { maximum: 50 }
end
