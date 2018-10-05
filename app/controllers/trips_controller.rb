class TripsController < ApplicationController
  def index
    @trips = Trip.all.order(:id)
  end


  def create
    if params[:passenger_id]
      driver =  Driver.find_by(status: "available", online: true)
      if driver.nil?
        render :drivernotfound, status: :not_found
      else
        @trip = Trip.new( driver_id: driver.id, passenger_id: params[:passenger_id], date: Date.today, cost: rand(1000..9999))
        @trip.save
        driver.update(status: "unavailable")
        redirect_to passenger_path(params[:passenger_id])
      end
    end
  end


  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
      render :notfound, status: :not_found
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

  def rate_trip
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def complete_trip
    @trip = Trip.find_by(id: params[:id].to_i)
    if @trip.update(rating: params[:rating])
      @trip.driver.update(status: "available")
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :rate_trip
    end
  end


  def destroy
    id = params[:id]
    trip = Trip.find_by(id: id)
    trip.driver.update(status: "available") if trip.rating.nil?
    if trip.destroy
      redirect_to passengers_path
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:rating)
  end

end
