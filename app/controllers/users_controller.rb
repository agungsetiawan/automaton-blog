class UsersController < ApplicationController

  before_action :require_login
  
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def create
  	@user=User.new(user_params)

  	if @user.save
  	  redirect_to users_path, notice: 'User has been created'
  	else
  	  render 'new'
  	end
  end

  def edit
  	@user=User.find_by_id(params[:id])
    redirect_to users_path unless @user && @user.id==current_user.id
  end

  def update
  	@user=User.find_by_id(params[:id])
    redirect_to users_path unless @user && @user.id==current_user.id
    
  	if @user.update_attributes(user_params)
  	  redirect_to users_path, notice: "User has been updated"
  	else
  	  render 'edit'
  	end
  end

  def show_article
    @user = User.find_by_id(params[:id])
    @articles = @user.articles

    respond_to do |format|
      format.html {render 'articles/show_all', layout: 'frontside'}
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :bio)
  end

end
