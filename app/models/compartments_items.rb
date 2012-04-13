class CompartmentsItems < ActiveRecord::Base
  attr_accessible :capacity, :compartment_type, :description, :error, :height, :item_code, :item_id, :quantity_limit
end
