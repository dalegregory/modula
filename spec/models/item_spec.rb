require 'spec_helper'

describe Item do

  its(:code)      { should validate :presence }
  its(:operation) { should validate :inclusion, { in: Modula::OPERATIONS }}

end
