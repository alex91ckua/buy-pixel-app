class ContactUsMailer < ApplicationMailer
  def contact_us(name, email, subject, body)
    to = 'some@jm.com'
    @name = name
    @email = email
    @subject = subject
    @body = body
    mail(to: to, subject: 'Contact Us Message')
  end
end
