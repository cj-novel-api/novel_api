class Summary

  attr_reader :start, :stop, :mpg, :fuel_type

  def initialize(start, stop, mpg, fuel_type)
    @start = start
    @stop = stop
    @mpg = mpg.to_f
    @fuel_type = fuel_type
    @trip = RoadTrip.new(start, stop)
    @prices = FuelPriceData.new
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

  def total_cost
    "$#{(gallons_needed * gas_price_number).round(2)}"
  end
end
