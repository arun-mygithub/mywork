class AddInitialQuantityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :initial_quantity, :integer
  end
end
