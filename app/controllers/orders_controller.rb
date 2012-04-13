class OrdersController < ApplicationController

  respond_to :json

  def new
    @order = Order.new

    respond_with @order
  end

  def create
    @order = Order.store! params[:order]
    respond_with @order
  end

end
