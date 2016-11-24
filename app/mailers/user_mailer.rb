class UserMailer < ActionMailer::Base
  default from: "podipireddy5@gmail.com"

  def new_post_email(post, email)
    @post = post
    @email = email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
  end

  def new_user_welcome(user)
    @user = user
    @email = user.email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Welcome to SpoiltRoyal!')
  end

  def reset_password(user, new_pw)
    @user = user
    @new_pw = new_pw
    @email = user.email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Password Reset')
  end

  def new_message(reciever,user,message)
    
  end
end
