ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_url_options = { :host => 'localhost:3000' }
ActionMailer::Base.smtp_settings =
# {
#   :address => "mail.syncidlabs.com",
#   :port => 26, :domain => "syncidlabs.com",
#   :user_name => "test@syncidlabs.com",
#   :password => "[testaccount]",
#   :enable_starttls_auto => true, :openssl_verify_mode => 'none'
# }

ActionMailer::Base.smtp_settings =
{
  :address => "smtp.gmail.com",
    :port => "587",
    :domain => "gmail.com",
    :user_name => "infospondonroy@gmail.com",
    :password => "infotest1234",
    :authentication => "plain",
    :enable_starttls_auto => true
}
