require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @property = properties(:one)
    # This code is not idiomatically correct.
    @comment = @property.comments.build( content: "Lorem ipsum",
                                         user_id: @user.id )
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
  
  test "content is present" do
    @comment.content = "    "
    assert_not @comment.valid?
  end
  
  test "comment shouldnt be longer than 140 characters" do
    @comment.content = "a" * 141
    assert_not @comment.valid?
  end
  
  test "order by most recent first" do
    assert_equal comments(:most_recent), Comment.first
  end
  
end
