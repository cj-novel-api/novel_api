class Summary

  attr_reader :start, :stop, :mpg, :fuel_type, :date

  def initialize(start, stop, mpg, fuel_type, start_code, end_code, date)
    @start = start
    @stop = stop
    @mpg = mpg.to_f
    @date = date
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

  def ticket_before
    @flight.ticket_before
  end

  def recommendation
    f_cost = flight_cost[1..-1].to_f.round(2)
    d_cost = drive_cost[1..-1].to_f.round(2)
    if f_cost > d_cost
      "Do you really want to spend more money on a flight? Look at the time difference."
    elsif f_cost < d_cost
      "Do you really want to spend more money driving? Look at the time difference."
    else
      "Same price, just look at the time difference!"
    end
  end

  def drive_summary
    {"driving_distance" => distance,
      "total_gallons" => gallons_needed,
      "fuel_type" => fuel_type,
      "price_per_gallon" => gas_price,
      "driving_time" => time,
      "driving_cost" => drive_cost
    }
  end

  def flight_summary
    {"get_ticket_before" => ticket_before,
      "flight_itinerary" => itinerary,
      "flight_time" => flight_time,
      "flight_cost" => flight_cost
    }
  end
end
