class OrderItem < ActiveRecord::Base

  attr_accessor :compartment_type, :description

  attr_accessible :compartment_type,
                  :description,
                  :error,
                  :item_code,
                  :notes,
                  :order_name,
                  :order_type,
                  :quantity_requested,
                  :sub_code_a,
                  :sub_code_b, as: [:default, :admin]

  belongs_to :order

  validates :item_code,          presence: true
  validates :order_name,         presence: true
  validates :quantity_requested, presence: true
  validates :sub_code_a,         presence: true
  validates :sub_code_b,         presence: true

  before_save :send_item_to_modula
  before_save :send_compartment_to_modula

private

  # ensure modula is aware of this item
  def send_item_to_modula
    Item.where(code: item_code).first_or_create(description: description)
  end

  # let modula know where to store this item
  def send_compartment_to_modula
    CompartmentsItems.where(item_code: item_code).first_or_create(compartment_type: compartment_type)
  end

end
