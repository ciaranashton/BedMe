class PropertyAnswer < ActiveRecord::Base
  belongs_to :property_question
  belongs_to :user
end
