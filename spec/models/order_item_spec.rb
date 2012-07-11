require 'spec_helper'

describe OrderItem do

  it { should validate(:presence).of :item_code }
  it { should validate(:presence).of :item_code }
  it { should validate(:presence).of :order_name }
  it { should validate(:presence).of :order_name }
  it { should validate(:presence).of :quantity_requested }
  it { should validate(:presence).of :quantity_requested }
  it { should validate(:presence).of :sub_code_a }
  it { should validate(:presence).of :sub_code_b }

end
