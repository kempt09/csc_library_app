class UserMailer < ApplicationMailer
  def send_password(email, password, name = 'Library User')
    @credentials = {name: name, email: email, password: password}
    mail(to: email, subject: 'Log In CSC Library')
  end
end
