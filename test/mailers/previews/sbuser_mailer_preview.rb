# Preview all emails at http://localhost:3000/rails/mailers/sbuser_mailer
class SbuserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sbuser_mailer/sbuser_activate
  def sbuser_activate
    user = SbUser.first
    user.activation_token = SbUser.new_token
    SbuserMailer.sbuser_activate(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/sbuser_mailer/password_reset
  def password_reset
    user = SbUser.first
    user.reset_token = SbUser.new_token
    SbuserMailer.password_reset(user)

  end

end
