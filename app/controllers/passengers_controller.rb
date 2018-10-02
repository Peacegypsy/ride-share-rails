class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def create
  end

  def new
  end
end
