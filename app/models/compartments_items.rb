class CompartmentsItems < ActiveRecord::Base

  attr_accessible :capacity,
                  :compartment_type,
                  :description,
                  :error,
                  :height,
                  :item_code,
                  :quantity_limit

  validates :compartment_type, presence: true
  validates :item_code,        presence: true

end
