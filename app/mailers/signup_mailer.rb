class SignupMailer < ApplicationMailer
  default from: 'bookers2@example.com'

  def creation_email(user)
    @user = user
    mail(
      subject: '新規登録メール',
      to: @user.email
    )
  end
end
