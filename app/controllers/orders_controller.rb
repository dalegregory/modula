class OrdersController < ApplicationController

  respond_to :json

  def create
    @order = Order.execute! params[:order]
    respond_with @order
  end

end
