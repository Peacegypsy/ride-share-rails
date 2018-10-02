class DriversController < ApplicationController
  def index
    @drivers = Driver.all  
    end

    def create
    end

    def new
    end
end
