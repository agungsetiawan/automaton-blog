class SessionsController < ApplicationController

  layout 'authentication'

  def new
  end

  def create
  	@user=User.find_by_username(params[:session][:username])

  	if @user && @user.authenticate(params[:session][:password])
  	  session[:user_id]=@user.id
  	  redirect_to dashboard_path
  	else
  	  redirect_to login_path, alert: 'Username and or password incorret'
  	end
  end

  def destroy
    session[:user_id]=nil
    redirect_to login_path
  end

end
