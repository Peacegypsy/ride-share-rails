class DriversController < ApplicationController
  def index
    @drivers = Driver.all
    end

    def new
      @driver = Driver.new
    end

    def create
      @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
      if @driver.save
        redirect_to drivers_path # go to the index so we can see the book in the list
      else
        render :new # show the new book form view again
      end
    end

  end
