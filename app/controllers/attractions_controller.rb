class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    if current_user.admin
      attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(attraction)
    else
      flash[:alert] = "Not authorized"
      redirect_to attractions_path
    end
  end

  def new
    if !current_user.admin
      flash[:alert] = "Not authorized"
      redirect_to attractions_path
    else
      @attraction = Attraction.new
    end
  end

  def take_ride
    attraction = Attraction.find(params[:id])
    #binding.pry
    ride = Ride.new
    #binding.pry
    ride.user = current_user
    ride.attraction = attraction
    ride.save

    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end

  def update
    if !current_user.admin
      flash[:alert] = "Not authorized"
      redirect_to attractions_path
    else
      attraction = Attraction.find(params[:id])
      attraction.update(attraction_params)
      redirect_to attraction_path(attraction)
    end
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :min_height, :nausea_rating, :tickets)
  end

end
