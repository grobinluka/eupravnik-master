class UsersController < ApplicationController
    before_action :must_be_admin, only: [:edit, :destroy, :create]
  
  def show
    @user = User.find(params[:id])
    @user.discussions = @user.discussions
  end
  
  def index
    @users = User.all
  end
  
  def must_be_admin
    if current_user.admin == false || current_user.admin == NIL
      redirect_to root_path, notice: "Admin Needed."
    end
  end
end
