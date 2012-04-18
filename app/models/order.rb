class Order < ActiveRecord::Base

  attr_accessible :command,
                  :description,
                  :error,
                  :items_attributes,
                  :name,
                  :operation

  has_many :items,    class_name: 'OrderItem'
  has_many :outcomes, class_name: 'OrderOutcome'

  accepts_nested_attributes_for :items

  validates :name,      presence: true
  validates :command,   inclusion: { in: Modula::COMMANDS }
  validates :operation, inclusion: { in: Modula::OPERATIONS }

  def self.execute! attrs
    order = Order.new attrs

    # save the order items before saving the order
    order.items.each do |item|
      item.order_name = order.name
      item.save!
    end

    order.save!
    order
  end

end
