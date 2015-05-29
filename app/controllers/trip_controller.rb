class TripController < ApplicationController

  def info
    @roadtrip = RoadTrip.new(params[:start], params[:stop])
  end

end
