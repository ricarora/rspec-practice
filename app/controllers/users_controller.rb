class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email))
    @user.save
    # send email
    UserMailer.sign_up(@user.id).deliver
    session[:user_id] = @user.id
    # puts @user.errors.inspect
    # puts params.inspect
    redirect_to root_path
  end
end
