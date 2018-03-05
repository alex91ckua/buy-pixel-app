class ApplicationMailer < ActionMailer::Base
  default from: Setting.default_from_email_address
  layout 'mailer'
end
