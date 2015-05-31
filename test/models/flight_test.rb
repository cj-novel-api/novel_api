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

  def test_can_get_flight_info
    flight = Flight.new("RDU", "SFO", "2015-06-01")

    assert_equal "USD327.10", flight.flight_price
    assert_equal "US", flight.flight_carrier
    assert_equal "1840", flight.flight_number
  end

  def test_can_get_origin_and_destination
    flight = Flight.new("RDU", "SFO", "2015-06-01")

    assert_equal "RDU", flight.flight_origin
    assert_equal "CLT", flight.flight_destination
  end
end
