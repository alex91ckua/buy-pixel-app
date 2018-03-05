class ContactUsMailer < ApplicationMailer
  def contact_us(name, email, subject, body)
    to = Setting.email_address
    @name = name
    @email = email
    @subject = subject
    @body = body
    mail(to: to, subject: 'Contact Us Message')
  end
end
