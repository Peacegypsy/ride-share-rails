class TripsController < ApplicationController
  def index
    @trips = Trip.all.order(:id)
  end

  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end


  def create
    @trip = Trip.new(id: params[:trip][:id], driver_id: params[:trip][:driver_id], passenger_id: params[:trip][:passenger_id], date: params[:trip][:date], rating: params[:trip][:rating], cost: params[:trip][:cost])
    if @trip.save
      redirect_to trip_path
    else
      render :new
    end
  end

  def new
    @trip = Trip.new
  end
  def edit
    @trip = Trip.find(params[:id].to_i)
  end
  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

end
def trip_params
  return params.require(:trip).permit(:rating)
end
