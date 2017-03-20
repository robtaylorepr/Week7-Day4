class PhotoMailer < ApplicationMailer

  def share(photo, email)
    @photo = photo
    mail(to: email, subject: "Check out this awesome photo!")
  end

end
