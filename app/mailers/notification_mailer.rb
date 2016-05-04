class NotificationMailer < ApplicationMailer

  default from: "ranjeev.wwindia@gmail.com"

  def order_status_email(order, user)
    @order = order
    @user = user
    mail(to: 'ranjeev.kumar@wwindia.com', subject: 'Track your order status')
  end

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Demo Shopping Cart app.')
  end
end
