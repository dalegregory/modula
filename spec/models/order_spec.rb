require 'spec_helper'

describe Order do

  its(:name)      { should validate :presence }
  its(:command)   { should validate :inclusion, { in: Modula::COMMANDS }}
  its(:operation) { should validate :inclusion, { in: Modula::OPERATIONS }}

end
