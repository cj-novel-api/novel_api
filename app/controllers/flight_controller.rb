class FlightController < ApplicationController

  def info
    @flight = Flight.new(params[:start_code], params[:end_code], params[:date])
  end

end
