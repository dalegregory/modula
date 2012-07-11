require 'spec_helper'

describe Order do

  it { should validate(:presence).of :name }
  it { should validate(:inclusion).of(:command).with in: Modula::COMMANDS }
  it { should validate(:inclusion).of(:operation).with in: Modula::OPERATIONS }

end
