class Property < ActiveRecord::Base
    has_many :property_questions
    has_many :user_property_periods
    validates :addressLine1, presence: true, length: {maximum: 30}
    validates :addressLine2,  length: {maximum: 30}
    validates :town, presence: true, length: {maximum: 50}
    validates :postcode, presence: true, length: {maximum: 8}
end
