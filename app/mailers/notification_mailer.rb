class NotificationMailer < ApplicationMailer

  default from: "ranjeev.wwindia@gmail.com"

  def order_status_email(order, user)
    @order = order
    @user = user
    mail(to: @user.email, subject: 'Track your order status')
  end

  def welcome_email(user)
    @user = user
    @url = root_url + "users/sign_in"
    mail(to: @user.email, subject: 'Welcome to My Demo Shopping Cart app.')
  end

  def newsletter_email()
    emails = emails = User.where(newsletter: :true).collect {|u| [ u.email ] }
    emails.each do |email|
      mail(to: email, subject: 'Newsletter')
    end
  end
end
