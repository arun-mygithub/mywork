require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :orders

  should have_many(:line_items)

  test "order attributes must not be empty" do
  	order = Order.new
  	assert order.invalid?
  	assert order.errors[:name].any?
  	assert order.errors[:address].any?
  	assert order.errors[:email].any?
  	assert order.errors[:pay_type].any?
  end

   test "should validate the presence of name" do
    order = Order.new(:name       => " ",
                      :address => "BBC",
                      :email   => "contactus@kiprosh.com",
                      :pay_type => "check")

   assert order.invalid? 
   # assert_equal "There is no name"
   # assert order.errors[:name].join(';')

   end

  # test "should validate the presence of name" do
  #   order = Order.new(:name       => "arun",
  #                     :address => " ",
  #                     :email   => "contactus@kiprosh.com",
  #                     :pay_type => "check")

  #  assert order.invalid? 
  #  # assert_equal "There is no name"
  #  # assert order.errors[:name].join(';')

  #  end

  test "should validate the presence of address" do
     order  = orders(:three)

     assert order.valid? 
  end

  test "should validate the presence of address" do
     order  = orders(:three)

     assert order.invalid? 
  end

  


  
end
