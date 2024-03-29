class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy

  attr_accessible :quantity, :initial_quantity

  attr_reader :items

 

	def add_product(product_id)
    
         current_item = line_items.where(:product_id => product_id).first
             if current_item && current_item.product.initial_quantity.present?
               current_item.quantity += 1
               current_item.product.initial_quantity -= 1
               current_item.product.save
               
             else
               current_item = LineItem.new(:product_id=>product_id, :quantity => 1)
               current_item.product.initial_quantity -= 1
               current_item.product.save
               

               line_items << current_item
             end
               current_item
    end

    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end

       def total_items
            line_items.sum(:quantity)
       end

       
  # attr_accessible :title, :body
end
