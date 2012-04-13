class OrderItem < ActiveRecord::Base

  attr_accessor :compartment_type, :description

  attr_accessible :compartment_type,
                  :description,
                  :error,
                  :item_code,
                  :notes,
                  :order_name,
                  :quantity_requested,
                  :sub_code_a,
                  :sub_code_b

  belongs_to :order

  before_save :send_item_to_modula
private

  # ensure modula is aware of this item
  def send_item_to_modula
    Item.where(code: item_code).first_or_create(description: description)
  end

end
