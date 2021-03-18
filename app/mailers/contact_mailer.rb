class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  def send_mail(inquire)
    @inquire = inquire
    mail(
      from: 'system@example.com',
      to:   'toy.yu.63@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end
end