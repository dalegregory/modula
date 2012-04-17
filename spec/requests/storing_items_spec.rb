require 'spec_helper'

describe 'Storing Items' do

  before do
    data = data_file 'order-single.json'
    @json = JSON.parse data

    post '/orders', @json, { 'HTTP_ACCEPT' => 'application/json' }
  end

  it 'creates an item' do
    Item.count.should == 1
  end

  it 'creates an item' do
    CompartmentsItems.count.should == 1
  end

  it 'creates a OrderItem' do
    OrderItem.count.should == 1
  end

  it 'creates an Order' do
    Order.count.should == 1
  end

  it 'returns the order as json' do
    response.body.should == Order.first.to_json
  end

  describe 'the new Item' do

    let(:item_attrs) { @json['order']['items_attributes'].first }

    subject { Item.first }
    its(:code)        { should == item_attrs['item_code']   }
    its(:description) { should == item_attrs['description'] }

  end

  describe 'the new CompartmentsItems' do

    let(:item_attrs) { @json['order']['items_attributes'].first }

    subject { CompartmentsItems.first }
    its(:item_code)        { should == item_attrs['item_code'] }
    its(:compartment_type) { should == item_attrs['compartment_type'] }

  end

  describe 'the new OrderItem' do

    let(:item_attrs) { @json['order']['items_attributes'].first }

    subject { OrderItem.first }
    its(:item_code)          { should == item_attrs['item_code'] }
    its(:notes)              { should == item_attrs['notes'] }
    its(:order_name)         { should == @json['order']['name'] }
    its(:quantity_requested) { should == item_attrs['quantity_requested'].to_i }
    its(:sub_code_a)         { should == item_attrs['sub_code_a'] }
    its(:sub_code_b)         { should == item_attrs['sub_code_b'] }
  end

  describe 'the new Order' do

    subject { Order.first }
    its(:name)        { should == @json['order']['name'] }
    its(:description) { should == @json['order']['description'] }

  end

end
