class PriceController < ApplicationController

  def index
    #@roadtrips = RoadTrip.all(?)
    render json: FuelPriceData.new
  end

  def show
    #@roadtrip = RoadTrip.find_by_id[params(:id)]
  end

end
