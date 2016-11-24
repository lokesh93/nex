class Notifier < ActionMailer::Base

  def notification_update(user, acitvities)
    @user = user
    @activities = acitvities
   
    mail(
      subject: "notification",
      from: "spon121@gmail.com",
      cc: "spon121@gmail.com",
      to: @user.email ,
      date: Time.now)
  end
end