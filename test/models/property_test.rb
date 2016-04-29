require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  def setup
    #@user = users(:michael)
    @property = Property.new(:one)
  end

  test "should be valid" do
    assert @property.valid?
  end
  
   test "addres line 1 should be present" do
    @property.addressLine1 = "     "
    assert_not @property.valid?
  end
  
   test "address line 1 should not be too long" do
    @property.addressLine1 = "b" * 31
    assert_not @property.valid?
  end

  test "address line 2 should not be too long" do
    @property.addressLine2 = "b" * 31
    assert_not @property.valid?
  end
   
  test "town should be present" do
    @property.town = ""
    assert_not @property.valid?
  end
  
  test "town shouldn't be too long" do
    @property.town = "b"*51
    assert_not @property.valid?
  end
  
  test "associated comments are destroyed" do
    @property.save
    @property.comments.create!(user_id: @user.id, content: "Some comment")
    assert_difference 'Comment.count', -1 do
      @property.destroy
    end
  end

end