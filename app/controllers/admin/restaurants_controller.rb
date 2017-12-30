class Admin::RestaurantsController < Admin::BaseController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_restaurants_path
      flash[:notice] = "restaurant was successfully created"
    else
      render :new
      flash[:alert] = "restaurant was failed to create"
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant)
      flash[:notice] = "Restaurant was successfully updated!!"
    else
      render :edit
      flash[:notice] = "Restaurant was failed to update"
    end
  end 

private
  


  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end



end
