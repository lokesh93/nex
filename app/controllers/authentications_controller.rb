class AuthenticationsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    params = request.env['omniauth.params']
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
 
    if authentication
      # User is already registered with application
      flash[:info] = 'Signed in successfully.'
      sign_in_and_redirect(authentication.user,false)
      @new_user = false
    elsif current_user
      # User is signed in but has not already authenticated with this social network
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      current_user.save
 
      flash[:info] = 'Authentication successful.'
      redirect_to home_url
      @new_user = false
    else
      # User is new to this application
      @new_user = true
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      @password = (0...50).map { o[rand(o.length)] }.join
      @username = nil
      @name = omniauth['info']['name'].split(" ").join("_")
      @number = ""
      while @username == nil
        @check = @name + @number
        if User.where(:username => @check).empty?
          @username = @check
        else
          @number = (@number.to_i + 1).to_s
        end
      end

      user = User.create(
        username: @username,
        email: omniauth['info']['email'],
        password: @password,
        password_confirmation: @password,
        first_name: omniauth['info']['first_name'],
        last_name: omniauth['info']['last_name'],
        account_type: params["type"]
      )
      user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      user.save

      if user.id != nil
        if user.account_type == "Vendor"
          vendor_account = Vendor.create
          user.update(account: vendor_account)
          EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: user)
        else
          consumer_account = Consumer.create
          user.update(account: consumer_account)
        end
        EmailNotificationSetting.create(settings_for: 'Conversation', timed_task: TimedTask.first, user: user)
        EmailNotificationSetting.create(settings_for: 'Post', timed_task: TimedTask.first, user: user)
        EmailNotificationSetting.create(settings_for: 'Comment', timed_task: TimedTask.first, user: user)
        EmailNotificationSetting.create(settings_for: 'Bid', timed_task: TimedTask.first, user: user)
        flash[:info] = 'User created and signed in successfully.'
        sign_in_and_redirect(user,@new_user)
      else
        raise
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_path
      end
    end
  end
 
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url
  end
 
  private
  def sign_in_and_redirect(user,new_user)
    unless current_user
      user_session = UserSession.create(user, user.persistence_token)
      user_session.save
    end
    if new_user == true
      redirect_to account_user_path(user,:new_user => new_user)
    else
      redirect_to overview_user_path(user)
    end
  end
end