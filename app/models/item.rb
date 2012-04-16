class Item < ActiveRecord::Base

  attr_accessible :code,
                  :description,
                  :operation

  has_many :compartments_items

  validates :code,      presence: true
  validates :operation, inclusion: { in: Modula::OPERATIONS }

end
