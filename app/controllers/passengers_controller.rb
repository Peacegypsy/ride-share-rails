class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
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
    end

    def update
    end

    def destroy
    end

  end
