class Comment < ActiveRecord::Base
  belongs_to :property
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :property_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
