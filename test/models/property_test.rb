require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  def setup
    @property = Property.new(addressLine1: "11 Alhalambra Street", addressLine2: "Floor 4",
                     town: "Mombasa", postcode: "MB24AH")
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
  
    test "postcode should be present" do
    @property.postcode = ""
    assert_not @property.valid?
  end
  
  test "postcode shouldn't be too long" do
    @property.postcode = "b"*9
    assert_not @property.valid?
  end
end