class UsersController < ApplicationController
    before_action :must_be_admin, only: [:index]
  
  def show
    @user = User.find(params[:id])
    @user.discussions = @user.discussions
  end
  
  def index
    @users = User.all
  end
  
  def image_params
    params.require(:user).permit(:email, :name, :lastname, :admin, :image)
  end
  
  
end
