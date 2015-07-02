# require 'httparty'

class RoadTrip

  attr_reader :start, :stop, :page

  def initialize(start, stop)
    @start = start
    @stop = stop
    @page = get_data
  end

  def get_data
    HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start}&destination=#{@stop}&sensor=false&key=#{ENV["GOOGLE_KEY"]}")
  end

  def get_distance
    @page["routes"][0]["legs"][0]["distance"]["text"]
  end

  def get_time
    @page["routes"][0]["legs"][0]["duration"]["text"]
  end

  def total_time_in_hours
    time_string = get_time
    days_string = time_string[/\d+ day/]
    hours_string = time_string[/\d+ hour/]
    hours_from_days = days_string[/\d+/].to_f*24 rescue 0
    hours_from_hours = hours_string[/\d+/].to_f
    total_hours = hours_from_days + hours_from_hours
  end

  def start_location_lat
    @page["routes"][0]["legs"][0]["start_location"]["lat"]
  end

  def start_location_long
    @page["routes"][0]["legs"][0]["start_location"]["lng"]
  end

  def end_location_lat
    @page["routes"][0]["legs"][0]["end_location"]["lat"]
  end

  def end_location_long
    @page["routes"][0]["legs"][0]["end_location"]["lng"]
  end

end
