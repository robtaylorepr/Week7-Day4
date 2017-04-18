class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    @email = user.email
    mail(to: @email, subject: "Welcome to Galleria !")
  end

end
