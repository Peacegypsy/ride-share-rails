class TripsController < ApplicationController
  def index
    @trips = TRIPS 
  end
end
