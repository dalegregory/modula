class Order < ActiveRecord::Base

  attr_accessible :command,
                  :description,
                  :error,
                  :items_attributes,
                  :name,
                  :operation

  has_many :items, class_name: 'OrderItem'
  accepts_nested_attributes_for :items

  def self.store! attrs
    order = Order.new attrs
    order.items.each &:save! # save the order items before saving the order
  end

end
