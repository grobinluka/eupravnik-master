class UsersController < ApplicationController
    before_action :must_be_admin, only: [:index]
  
  def show
    @user = User.find(params[:id])
    @user.discussions = @user.discussions
  end
  
  def index
    @users = User.where('apartment_building_id = ?', current_user.apartment_building_id)
    @users_sa = User.all.order('name ASC')
  end
  
  def image_params
    params.require(:user).permit(:email, :name, :lastname, :admin, :image)
  end
  
  
end
