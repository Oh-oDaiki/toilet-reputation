class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :user_id, presence: true
  validates :value, presence: true, inclusion: { in: 1..5 }
end
