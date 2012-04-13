require 'spec_helper'

describe 'Storing Items' do

  before do
    data = data_file 'order-single.json'
    json = JSON.parse data

    post '/store', json, :type => :json
  end

  it 'creates an item' do
    Item.count.should == 1
  end

end
