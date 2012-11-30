require 'spec_helper'

describe CompartmentsItems do

  it { should validate(:presence).of :compartment_type }
  it { should validate(:presence).of :item_code }
  it { should validate(:inclusion).of(:operation).with in: Modula::OPERATIONS }

end
