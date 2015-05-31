require 'test_helper'
require 'flight.rb'
require 'minitest/pride'

class Flight
  private def get_data
    JSON.parse(File.open('./test/models/rdu_sfo.json').read)
  end
end

class FlightTest < ActiveSupport::TestCase

  def test_can_be_created
    assert Flight.new("RDU", "SFO", "2015-06-01")
  end

  def test_can_get_info
    flight = Flight.new("RDU", "SFO", "2015-06-01")

    assert_equal "$327.10", flight.price
    assert_equal "US", flight.carrier(0)
    assert_equal "1840", flight.number(0)
  end

  def test_can_get_origin_and_destination
    flight = Flight.new("RDU", "SFO", "2015-06-01")

    assert_equal "RDU", flight.origin(0)
    assert_equal "CLT", flight.destination(0)
  end

  def test_itinerary
    flight = Flight.new("RDU", "SFO", "2015-06-01")

    assert_equal [{"leg"=>1, "origin"=>"RDU", "destination"=>"CLT",
        "flight_number"=>"US 1840", "departure_time"=>"2015-06-01 at 16:05-04:00"},
        {"leg"=>2, "origin"=>"CLT", "destination"=>"SFO", "flight_number"=>"US 1799",
        "departure_time"=>"2015-06-01 at 18:00-04:00"}], flight.itinerary
  end
end
