class PriceController < ApplicationController

  def index
    render json: FuelPriceData.new
  end

  def show
    @prices = FuelPriceData.new
    if @prices.return_price(params[:fuel_type])

    else
      # render json: 'ERROR'
      redirect_to 'http://i.ytimg.com/vi/czmZ2HFx6q4/maxresdefault.jpg'
    end
  end
end
