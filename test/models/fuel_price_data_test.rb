
require 'test_helper'
require 'fuel_price_data.rb'
require 'minitest/pride'

class FuelPriceData
  private def get_data
    JSON.parse(File.open('./test/models/fuel_prices.json').read)
  end
end

class FuelPriceDataTest < ActiveSupport::TestCase

  def test_the_truth
    assert true
  end

  def test_exists
    assert FuelPriceData
  end

  def test_premium
    prices = FuelPriceData.new
    assert_equal 3.11, prices.return_price('p')
  end

  def test_regular
    prices = FuelPriceData.new
    assert_equal 2.74, prices.return_price('r')
  end

  def test_midgrade
    prices = FuelPriceData.new
    assert_equal 2.95, prices.return_price('m')
  end

  def test_diesel
    prices = FuelPriceData.new
    assert_equal 2.9, prices.return_price('d')
  end
end
