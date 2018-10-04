class PassengersController < ApplicationController
  def index
    @passengers = Passenger.where("online = true").order(:id)
  end

  def show
    id = params[:id].to_i
    @passenger = Passenger.find_by(id: id)

    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end

    def create
      @passenger = Passenger.new(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num])
      if @passenger.save
        redirect_to passengers_path
      else
        render :new
      end
    end

    def new
      @passenger = Passenger.new
    end

    def edit
        @passenger = Passenger.find(params[:id].to_i)
    end

    def update
      @passenger = Passenger.find_by(id: params[:id].to_i)
      if @passenger.update(passenger_params)
        redirect_to passenger_path(@passenger.id)
      else
        render :edit
    end
  end

  def change_status
    id = params[:id]
    passenger = Passenger.find_by(id: id)
    passenger.update(status: "unavailable")
    redirect_to passengers_path
  end

  def take_offline
    id = params[:id]
    passenger = Passenger.find_by(id: id)
    passenger.update(online: false)
    redirect_to passengers_path
  end

  end
  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
