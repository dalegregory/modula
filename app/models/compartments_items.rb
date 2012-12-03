class CompartmentsItems < ActiveRecord::Base

  attr_accessible :capacity,
                  :compartment_type,
                  :description,
                  :error,
                  :height,
                  :item_code,
                  :operation,
                  :quantity_limit, as: [:default, :admin]

  belongs_to :item

  validates :compartment_type, presence: true
  validates :item_code,        presence: true
  validates :operation,        inclusion: { in: Modula::OPERATIONS }

  def item_code= code
    self[:item_code] = code
    self.item = Item.find_by_code code
  end

end
