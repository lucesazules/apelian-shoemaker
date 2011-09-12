class OrdersMailer < ActionMailer::Base
  default from: "no-reply@apelian.com.ar"
  default to: "apelianjuan@hotmail.com"

  # Email of order form to seller
  def order_form(order)
    @order = order
    mail(:subject => "Orden: ##{order.id}")
  end
end
