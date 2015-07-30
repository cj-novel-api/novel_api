class Flight

  def initialize(start_code, end_code, date)
    @start_code = start_code
    @end_code = end_code
    @date = date
    @page = get_data
  end


  private def get_data
    HTTParty.post("https://www.googleapis.com/qpxExpress/v1/trips/search?key=#{ENV["GOOGLE_KEY"]}",
      :headers => { 'Content-Type' => 'application/json' },
      :body => {
        "request": {
          "slice": [{
            "origin": "#{@start_code}","destination": "#{@end_code}","date": "#{@date}"
          }],
          "passengers": {
            "adultCount": 1,"infantInLapCount": 0,"infantInSeatCount": 0,"childCount": 0,"seniorCount": 0
          },
          "solutions": 1,
          "refundable": false
        }
      }.to_json
    )
  end

  def price
    cost = @page["trips"]["tripOption"][0]["saleTotal"]
    new_cost = cost[3..-1]
    "$#{new_cost}"
  end

  def carrier(num)
    @page["trips"]["tripOption"][0]["slice"][0]["segment"][num]["flight"]["carrier"]
  end

  def number(num)
    @page["trips"]["tripOption"][0]["slice"][0]["segment"][num]["flight"]["number"]
  end

  def origin(num)
    @page["trips"]["tripOption"][0]["slice"][0]["segment"][num]["leg"][0]["origin"]
  end

  def destination(num)
    @page["trips"]["tripOption"][0]["slice"][0]["segment"][num]["leg"][0]["destination"]
  end

  def departs_on(num)
    day = @page["trips"]["tripOption"][0]["slice"][0]["segment"][num]["leg"][0]["departureTime"]
    day[0..9]
  end

  def departs_at(num)
    time = @page["trips"]["tripOption"][0]["slice"][0]["segment"][num]["leg"][0]["departureTime"]
    time[11..-1]
  end

  def total_time
    minutes = @page["trips"]["tripOption"][0]["slice"][0]["duration"].to_f
    hours = (minutes/60.0).round(2)
    "#{hours} hours"
  end

  def total_time_in_hours
    minutes = @page["trips"]["tripOption"][0]["slice"][0]["duration"].to_f
    (minutes/60.0).round(2)
  end

  def ticket_before
    @page["trips"]["tripOption"][0]["pricing"][0]["latestTicketingTime"]
  end

  def itinerary
    counter = 0
    stops = []
    until @page["trips"]["tripOption"][0]["slice"][0]["segment"][counter] == nil
      next_stop = {}
      next_stop["leg"] = counter+1
      next_stop["origin"] = origin(counter)
      next_stop["destination"] = destination(counter)
      next_stop["flight_number"] = "#{carrier(counter)} #{number(counter)}"
      next_stop["departure_time"] = "#{departs_on(counter)} at #{departs_at(counter)}"
      stops << next_stop
      counter += 1
    end
    stops
  end
end
