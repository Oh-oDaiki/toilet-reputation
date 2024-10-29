class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :ratings, dependent: :destroy
    
    accepts_nested_attributes_for :ratings

    validates :title, presence: true
    validates :content, presence: true
    validates :user, presence: true
end
