class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def email_receipt(order)
    @order = order
    @url  = "www.jungle.com"
    mail(to: @order.email, subject: "Receipt for order#{@order.id}")
  end
end
# Need: order_id, grand total, each line_items
