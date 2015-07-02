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

  def drive_time
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
    difference = flight_cost[1..-1].to_f - drive_cost[1..-1].to_f
    if difference > 0 # flight is more expensive
      "flight is more expensive by $#{(flight_cost[1..-1].to_f - drive_cost[1..-1].to_f).round(2).abs}"
    elsif difference < 0 # drive is more expensive
      "drive is more expensive by $#{(flight_cost[1..-1].to_f - drive_cost[1..-1].to_f).round(2).abs}"
    else
      "They cost the same"
    end

    # "$#{(flight_cost[1..-1].to_f - drive_cost[1..-1].to_f).round(2).abs}"
  end

  def time_difference
    difference = @flight.total_time_in_hours - @trip.total_time_in_hours
    if difference > 0 # flight is longer
      "Flight is #{difference.abs} hours longer"
    elsif difference < 0 # drive is longer
      "Drive is #{difference.abs} hours longer"
    else
      "Time is the same"
    end
  end

  #this method is necessary. It is used in the flight_summary method
  def ticket_before
    @flight.ticket_before
  end

  def cost_message
    f_cost = flight_cost[1..-1].to_f.round(2)
    d_cost = drive_cost[1..-1].to_f.round(2)
    if f_cost > d_cost
      "Do you really want to spend more money flying?"
    elsif f_cost < d_cost
      "Do you really want to spend more money driving?"
    else
      "Same price, just look at the time difference!"
    end
  end

  def time_message
    difference = @flight.total_time_in_hours - @trip.total_time_in_hours
    if difference > 0 # flight is longer
      "Do you really want to spend more time flying?"
    elsif difference < 0 # drive is longer
      "Do you really want to spend more time driving?"
    else
      "Time is the same. Look at the cost difference."
    end
  end

  def drive_summary
    {"driving_distance" => distance,
      "total_gallons" => gallons_needed,
      "fuel_type" => fuel_type,
      "price_per_gallon" => gas_price,
      "driving_time" => drive_time,
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
