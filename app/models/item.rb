class Item < ActiveRecord::Base

  attr_accessible :code,
                  :description

  validates :code, presence: true

end
