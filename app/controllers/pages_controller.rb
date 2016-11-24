class PagesController < ApplicationController
  def home
  end

  def forgotten_password
  end

  def admin
    @feedbacks = Feedback.all
  end 


  def reset_password
    @user = User.where(email: params[:email]).first

    if !@user.nil?
      if @user.first_name == params[:first_name]
        new_pw = [*('a'..'z'),*('0'..'9')].shuffle[0, 16].join
        @user.update(password: new_pw, password_confirmation: new_pw)
        UserMailer.reset_password(@user, new_pw).deliver
        redirect_to logout_path, notice: "Password reset success, please check email."
      else
        redirect_to :back, notice: "Invalid credentials."
      end
    else
      redirect_to :back, notice: "Email is not associated with an account."
    end
  end
end
