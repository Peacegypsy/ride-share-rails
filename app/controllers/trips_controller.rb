class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def create
    if params[:passenger_id]
      driver =  Driver.find_by(status: "available")
      if driver.nil?
        render :drivernotfound, status: :not_found
      else
        @trip = Trip.new( driver_id: driver.id, passenger_id: params[:passenger_id], date: Date.today, cost: 0)
        @trip.save
        driver.update(status: "unavailable")
        redirect_to passenger_path(params[:passenger_id])
      end
    end
  end

end
