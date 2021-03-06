class OrdersController < ApplicationController

  layout 'order'

  def show
    @order = Order.find params[:id]
  end

  def new
    @order = Order.new
    @order.order_details.build
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      OrdersMailer.order_form(@order).deliver
      redirect_to @order
    else
      render :action => :new
    end
  end
end
