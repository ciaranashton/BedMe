class Review < ActiveRecord::Base
    belongs_to :property
    belongs_to :user
    validates :user, presence: true
    validates :property, presence: true
    validates :rating_area, presence: true
    validates :rating_cleanliness, presence: true
    validates :rating_cost, presence: true
    validates :rating_landlord, presence: true
    validates :reviewText, presence: true, length: {maximum: 1400}
end
