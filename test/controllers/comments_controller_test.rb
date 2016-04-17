require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  def setup
    @comment = comments(:two)
  end
  
  test "redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post :create, comment: { user_id: 1, content: "This is a commment" }
    end
  end
  
  test "redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete :destroy, id: @comment
    end
    assert_redirected_to login_url
  end
  
  test "redirect destroy for wrong comment" do
    log_in_as(users(:michael))
    comment = comments(:ciaran)
    assert_no_difference 'Comment.count' do
      delete :destroy, id: comment
    end
    assert_redirected_to root_url
  end
  
end
