class Review < ActiveRecord::Base
    belongs_to :property
    belongs_to :user
    validates :user, presence: true
    validates :property, presence: true
    validates :rating_area, presence: true, numericality: {greater_than: 0, less_than: 11}
    validates :rating_cleanliness, presence: true, numericality: {greater_than: 0, less_than: 11}
    validates :rating_cost, presence: true, numericality: {greater_than: 0, less_than: 11}
    validates :rating_landlord, presence: true, numericality: {greater_than: 0, less_than: 11}
    validates :reviewText, presence: true, length: {maximum: 1400}
end
