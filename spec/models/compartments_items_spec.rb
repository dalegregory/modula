require 'spec_helper'

describe CompartmentsItems do

  its(:compartment_type) { should validate :presence }
  its(:item_code)        { should validate :presence }

end