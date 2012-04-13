class OrderItem < ActiveRecord::Base
  attr_accessible :error, :item_code, :notes, :order_name, :quantity_requested, :sub_code_a, :sub_code_b
end
