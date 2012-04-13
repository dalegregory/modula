require 'spec_helper'

describe Item do

  its(:code) { should validate :presence }

end
