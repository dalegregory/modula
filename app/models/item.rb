class Item < ActiveRecord::Base

  attr_accessible :code,
                  :description,
                  :operation

  validates :code,      presence: true
  validates :operation, inclusion: { in: Modula::OPERATIONS }
end
