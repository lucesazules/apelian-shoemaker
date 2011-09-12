class OrdersController < ApplicationController

  def new
    @order = Order.new
    5.times{ @order.order_details.build }
    render :layout => 'order'
  end

  def create
    @order = Order.new(params[:order])
    if @order.save!
      OrdersMailer.order_form(@order).deliver
      redirect_to new_order_path, :flash => { :success => "Orden enviada" }
    else
      render :action => :new, :layout => 'order'
    end
  end
end
