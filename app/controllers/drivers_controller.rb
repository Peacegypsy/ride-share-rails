class DriversController < ApplicationController
  def index
    @drivers = Driver.where("online = true").order(:id)
  end

  def show
    id = params[:id]
    @driver = Driver.find_by(id: id)
  end

  def create
    @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
    if @driver.save
      redirect_to drivers_path # go to the index so we can see the book in the list
    else
      render :new # show the new book form view again
    end
  end

  def new
    @driver = Driver.new
  end

  def edit
    @driver = Driver.find(params[:id].to_i)
  end

  def update
    @driver = Driver.find(params[:id].to_i)
    @driver.name = params[:driver][:name]
    @driver.vin = params[:driver][:vin]
    if @driver.save
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end

  def change_status
    id = params[:id]
    driver = Driver.find_by(id: id)
    driver.update(status: "unavailable")
    redirect_to drivers_path
  end

  def take_offline
    id = params[:id]
    driver = Driver.find_by(id: id)
    driver.update(online: false)
    redirect_to drivers_path
  end

end
