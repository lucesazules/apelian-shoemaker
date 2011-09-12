class OrdersController < ApplicationController
  def new
    @order = Order.new
    5.times{ @order.order_details.build }
    render :layout => false
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

  def show
    # TODO
  end
end
