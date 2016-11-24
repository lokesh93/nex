class Notifier < ActionMailer::Base

  def self.notification_update(user, acitvities)
    @user = user
    @acitvities = acitvities
    mail(
      subject: "notification",
      from: "infosyncidlabs@gmail.com",
      cc: "infosyncidlabs@gmail.com",
      to: user.email ,
      date: Time.now)
  end
end