require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @property = properties(:one)
    # This code is not idiomatically correct.
    @review = @property.reviews.build(   reviewText: "Lorem ipsum",
                                         user_id: @user.id,
                                         rating_area: 5,
                                         rating_cleanliness: 6,
                                         rating_landlord: 4,
                                         rating_cost: 7)
  end
  
  
   test "should be valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end
  
  test "text is present" do
    @review.reviewText = "    "
    assert_not @review.valid?
  end
  
  test "review shouldnt be longer than 1400 characters" do
    @review.reviewText = "a" * 1401
    assert_not @review.valid?
  end
  
  test "ratings shouldn't be greater than 10" do
    @review.rating_area = 11
    assert_not @review.valid?
  end
  
  test "ratings shouldn't be smaller than 1" do
    @review.rating_area = 0
    assert_not @review.valid?
  end
  
end
