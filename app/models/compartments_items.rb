class CompartmentsItems < ActiveRecord::Base

  attr_accessible :capacity,
                  :compartment_type,
                  :description,
                  :error,
                  :height,
                  :item_code,
                  :operation,
                  :quantity_limit

  validates :compartment_type, presence: true
  validates :item_code,        presence: true
  validates :operation,        inclusion: { in: Modula::OPERATIONS }

end
