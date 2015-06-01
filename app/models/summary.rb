class Summary

  attr_reader :start, :stop, :mpg, :fuel_type

  def initialize(start, stop, mpg, fuel_type, start_code, end_code, date)
    @start = start
    @stop = stop
    @mpg = mpg.to_f
    @fuel_type = fuel_type
    @trip = RoadTrip.new(start, stop)
    @prices = FuelPriceData.new
    @flight = Flight.new(start_code, end_code, date)
  end

  def distance
    @trip.get_distance
  end

  def distance_number
    distance_string = @trip.get_distance[0..-4]
    distance_string.gsub(",", "").to_f
  end

  def time
    @trip.get_time
  end

  def gas_price
    "$#{@prices.return_price(@fuel_type)}"
  end

  def gas_price_number
    @prices.return_price(@fuel_type)
  end

  def gallons_needed
    (distance_number/@mpg).round(2)
  end

  def drive_cost
    "$#{(gallons_needed * gas_price_number).round(2)}"
  end

  def itinerary
    @flight.itinerary
  end

  def flight_cost
    @flight.price
  end

  def flight_time
    @flight.total_time
  end

  def difference
    "$#{(flight_cost[1..-1].to_f - drive_cost[1..-1].to_f).round(2).abs}"
  end

  def recommendation
    f_cost = flight_cost[1..-1].to_f.round(2)
    d_cost = drive_cost[1..-1].to_f.round(2)
    if f_cost > d_cost
      "Do you really want to spend more money on a flight?"
    elsif f_cost < d_cost
      "Do you really want to spend more money driving?"
    else
      "Same price, just look at the time difference!"
    end
  end
end
