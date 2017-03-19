class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: 'epr1935@icloud.com', subject: "Welcome to Surf-N-Paddle!")
  end

end
