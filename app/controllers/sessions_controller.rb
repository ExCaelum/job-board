# This is the session controller that controls current_user
class SessionsController < ApplicationController
  skip_before_action :require_log_in

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = 'Please make sure all fields are correct...'
      render(:new)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
