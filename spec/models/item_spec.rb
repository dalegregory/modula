require 'spec_helper'

describe Item do

  it { should validate(:presence).of :code }
  it { should validate(:inclusion).of(:operation).with in: Modula::OPERATIONS }

end
