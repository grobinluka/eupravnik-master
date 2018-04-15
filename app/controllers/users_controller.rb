class UsersController < ApplicationController
    before_action :must_be_admin, only: [:index]
  
  def show
    @user = User.find(params[:id])
    @user.discussions = @user.discussions
  end
  
  def index
    @users = User.all
  end
  
  def must_be_admin
    if current_user.admin == false || current_user.admin == NIL
      redirect_to root_path, alert: "You don't have the rights to be there."
    end
  end
end
