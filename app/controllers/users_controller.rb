class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @commented_restaurants = @user.restaurants.reorder("name").uniq
    @favorited_restaurants = @user.favorited_restaurants.reorder("name")
    @followings = @user.followings.reorder("name")
    @followers = @user.followers.reorder("name")
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  def friend_list
    @friends = current_user.all_friends
  end


private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

end


@recent_restaurants = Restaurant.order(created_at: :desc).limit(10)