class Review < ActiveRecord::Base
    belongs_to :user_property_period
    has_many :review_commentsgit 
end
