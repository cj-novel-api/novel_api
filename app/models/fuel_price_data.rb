
class FuelPriceData
  attr_reader :data
  def initialize
    @data = get_data
  end

  private def get_data
    HTTParty.get('http://www.fueleconomy.gov/ws/rest/fuelprices')
  end

  # OWEN METHOD (mod CRUZ)
  def return_price(fuel)
    if fuel == "d" || fuel == "diesel"

      @data["fuelPrices"]["diesel"].to_f

    elsif fuel == "m" || fuel == 'midgrade'

      @data["fuelPrices"]["midgrade"].to_f

    elsif fuel == "p" || fuel == 'premium'

      @data["fuelPrices"]["premium"].to_f

    elsif fuel == "r" || fuel == 'regular'

      @data["fuelPrices"]["regular"].to_f

    else

      false

    end
  end
end
