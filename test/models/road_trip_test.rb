
require 'test_helper'
require 'road_trip.rb'


class RoadTrip
  def get_data
    JSON.parse(File.open("./test/models/raleigh_portland.json").read)
  end
end

class RoadTripTest < ActiveSupport::TestCase
  def test_can_be_created
    assert RoadTrip.new("Durham+NC", "Portland+OR")
  end

  def test_can_get_distance
    trip = RoadTrip.new("Durham+NC", "Portland+OR")
    assert_equal "2,842 mi", trip.get_distance
  end

  def test_can_get_time
    trip = RoadTrip.new("Durham+NC", "Portland+OR")
    assert_equal "1 day 18 hours", trip.get_time
  end

  def test_can_get_start_coordinates
    trip = RoadTrip.new("Durham+NC", "Portland+OR")
    assert_equal 35.9939234, trip.start_location_lat
    assert_equal -78.89872249999999, trip.start_location_long
  end

  def test_can_get_end_coordinates
    trip = RoadTrip.new("Durham+NC", "Portland+OR")
    assert_equal 45.523062, trip.end_location_lat
    assert_equal -122.676479, trip.end_location_long
  end
end
