class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.discussions = @user.discussions
  end
  def index
    @users = User.all
  end
end
