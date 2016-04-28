require 'carrierwave/orm/activerecord'

class Property < ActiveRecord::Base
    mount_uploader :img, ImgUploader
    has_many :comments, dependent: :destroy
    has_many :property_questions
    has_many :reviews
    validates :addressLine1, presence: true, length: {maximum: 30}
    validates :addressLine2,  length: {maximum: 30}
    validates :town, presence: true, length: {maximum: 50}
    validates :postcode, presence: true, length: {maximum: 8}
end
