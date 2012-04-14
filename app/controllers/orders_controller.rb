class OrdersController < ApplicationController

  respond_to :json

  def create
    @order = Order.store! params[:order]
    respond_with @order
  end

end
