require 'spec_helper'

describe OrderItem do

  its(:item_code)          { should validate :presence }
  its(:item_code)          { should validate :presence }
  its(:order_name)         { should validate :presence }
  its(:order_name)         { should validate :presence }
  its(:quantity_requested) { should validate :presence }
  its(:quantity_requested) { should validate :presence }
  its(:sub_code_a)         { should validate :presence }
  its(:sub_code_b)         { should validate :presence }

end
