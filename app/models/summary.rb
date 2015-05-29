class Summary

  attr_reader :start, :stop, :mpg, :fuel_type

  def initialize(start, stop, mpg, fuel_type)
    @start = start
    @stop = stop
    @mpg = mpg.to_f
    @fuel_type = fuel_type
  end

  def distance
    trip = RoadTrip.new(@start, @stop)
    trip.get_distance
  end

  def distance_number
    trip = RoadTrip.new(@start, @stop)
    distance_string = trip.get_distance[0..-4]
    distance_string.gsub(",", "").to_f
  end

  def time
    trip = RoadTrip.new(@start, @stop)
    trip.get_time
  end

  def gas_price
    prices = FuelPriceData.new
    rate = prices.return_price(@fuel_type)
  end

  def gallons_needed
    (distance_number/@mpg).round(2)
  end

  def total_cost
    "$#{(gallons_needed * gas_price).round(2)}"
  end
end
