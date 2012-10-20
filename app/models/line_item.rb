class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
    belongs_to :cart

  attr_accessible :cart_id, :product_id, :product, :quantity, :initial_quantity

  def total_price
      product.price * quantity
  end

   # def self.from_cart_item(cart_item)
   #   li = self.new
   #   li.product = cart_item.product
   #   li.quantity = cart_item.quantity
   #   li.total_price = cart_item.price
   #   li
   #  end


end
