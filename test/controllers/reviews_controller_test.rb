require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  def setup
    @review = reviews(:one)
  end
  
  test "redirect create when not logged in" do
    assert_no_difference 'Review.count' do
      post :create, review: { user_id: 1, reviewText: "This is a review", rating_area: 4, 
                              rating_cost: 7,  rating_cleanliness: 5,  rating_landlord: 1 }
    end
  end
  
  test "redirect destroy when not logged in" do
    assert_no_difference 'Review.count' do
      delete :destroy, id: @review
    end
    assert_redirected_to login_url
  end
  
  test "redirect destroy for wrong review" do
    log_in_as(users(:michael))
    review = reviews(:two)
    assert_no_difference 'Review.count' do
      delete :destroy, id: review
    end
    assert_redirected_to root_url
  end
end
