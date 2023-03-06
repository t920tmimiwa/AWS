class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uname: params[:user][:uname], pass: BCrypt::Password.create(params[:user][:pass]))
    if @user.save
      redirect_to root_path
    else
      render new_user_path
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    session.delete(:uname)
    redirect_to root_path
  end
end