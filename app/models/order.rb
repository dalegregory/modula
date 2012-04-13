class Order < ActiveRecord::Base
  attr_accessible :command, :description, :error, :name, :operation
end
