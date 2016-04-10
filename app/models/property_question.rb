class PropertyQuestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  validates :questionTitle, presence: true, length: {maximum: 100}
  validates :questionText, presence: true
end
