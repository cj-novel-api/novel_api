class Flight

  def initialize(start_code, end_code, date)
    @start_code = start_code
    @end_code = end_code
    @date = date
    @page = get_data
  end


  private def get_data
    HTTParty.post("https://www.googleapis.com/qpxExpress/v1/trips/search?key=#{ENV["GOOGLE_KEY"]}",
    :body =>{
      "request": {
        "slice": [
          {
            "origin": "#{@start_code}",
            "destination": "#{@end_code}",
            "date": "#{@date}"
          }
        ],
        "passengers": {
          "adultCount": 1,
          "infantInLapCount": 0,
          "infantInSeatCount": 0,
          "childCount": 0,
          "seniorCount": 0
        },
        "solutions": 1,
        "refundable": false
      }
    }.to_json,
    :headers => { 'Content-Type' => 'application/json' })
  end

  def flight_price
    @page["trips"]["tripOption"][0]["saleTotal"]
  end

  def flight_carrier
    @page["trips"]["tripOption"][0]["slice"][0]["segment"][0]["flight"]["carrier"]
  end

  def flight_number
    @page["trips"]["tripOption"][0]["slice"][0]["segment"][0]["flight"]["number"]
  end
  
end
