require 'httparty'
class FuelPriceData #< ActiveRecord::Base
  attr_reader :data, :fuel_type
  def initialize
    @data = get_data
  end

  private def get_data
    HTTParty.get('http://www.fueleconomy.gov/ws/rest/fuelprices').to_json
  end

  def d
    @data["fuelPrices"]["diesel"].to_f
  end

  def m
    @data["fuelPrices"]["midgrade"].to_f
  end

  def p
    @data["fuelPrices"]["premium"].to_f
  end

  def r
    @data["fuelPrices"]["regular"].to_f
  end
end
