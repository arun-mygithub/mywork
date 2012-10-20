require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:order)
  should belong_to(:product)
  should belong_to(:cart)

  
end
