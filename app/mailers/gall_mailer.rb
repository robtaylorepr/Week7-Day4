class GallMailer < ApplicationMailer

  def share(gall, email)
    @gall = gall
    mail(to: email, subject: "Check out this awesome gallery!")
  end

end
