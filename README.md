#Deals on Wheels

Spend your money wisely when you travel.

###What it does

This API can help the savvy traveler make intelligent financial decisions for
long-distance trips in the continental US.  

Airline tickets prohibitively expensive?  Got a fuel-efficient car?  Ever wonder
if it would be cheaper to drive to your destination instead of flying? Deals on Wheels
can give you the definitive answer.

###How it does it

Deals on Wheels mashes up information from three other APIs

1. [Google Directions](https://developers.google.com/maps/documentation/directions/)
  * Calculates driving distance and trip duration
2. [Google QPX](https://developers.google.com/qpx-express/)
  * Returns cheapest available one-way flight given an origin airport code,
  destination airport code, and date of travel
3. [FuelEconomy](http://www.fueleconomy.gov/feg/ws/)
  * Provides average gas prices in the US (updated weekly)

###How to use it

*See full documentation of each option below*

* `/results`: returns full `.json` output of both flight and roadtrip information, along with predicted costs for both flying and driving
* `/trip/info`: returns full `.json` output of roadtrip information
* `/flight/info`: returns full `.json` output of flight information
* `/gasprice/index`: returns all current gas prices

####Results

Required keys:

* `start` (City, State)
* `stop` (City, State)
* `mpg` (integer)
* `fuel_type` (diesel, regular, midgrade, premium)
* `start_code` (3-letter airport code)
* `end_code` (3-letter airport code)
* `date` (YYYY-MM-DD)

Example URL input:
`http://localhost:3000/results.json?start=Chapel%20Hill,%20NC&stop=Portland,%20OR&mpg=35&fuel_type=regular&start_code=RDU&end_code=PDX&date=2015-07-08`

Example JSON output:
```json
{
"start": "Chapel Hill, NC",
"stop": "Portland, OR",
"driving_distance": "2,839 mi",
"driving_time": "1 day 18 hours",
"total_gallons": 81.11,
"price_per_gallon": "$2.77",
"driving_cost": "$224.67",
"flight_itinerary": [
{
"leg": 1,
"origin": "RDU",
"destination": "DFW",
"flight_number": "US 1349",
"departure_time": "2015-07-08 at 07:55-04:00"
},
{
"leg": 2,
"origin": "DFW",
"destination": "PDX",
"flight_number": "US 1355",
"departure_time": "2015-07-08 at 10:45-05:00"
}
],
"flight_cost": "$298.60"
}
```

#### RoadTrip

Required keys:

* `start` (City, State)
* `stop` (City, State)

Example URL input: `http://localhost:3000/trip/info.json?start=Atlanta,%20GA&stop=Dallas,%20TX`

Example JSON output:

```json
{
"start": "Atlanta, GA",
"stop": "Dallas, TX",
"distance": "781 mi",
"time": "11 hours 14 mins"
}
```

#### Flight

Required keys:

* `start_code` (3-letter airport code)
* `end_code` (3-letter airport code)
* `date` (YYYY-MM-DD)

Example URL input: `http://localhost:3000/flight/info.json?start_code=JFK&end_code=SFO&date=2015-07-08`

Example JSON output:

```json
{
"itinerary": [
{
"leg": 1,
"origin": "JFK",
"destination": "SFO",
"flight_number": "B6 15",
"departure_time": "2015-07-08 at 06:50-04:00"
}
],
"price": "$278.25"
}
```


#### GasPrice

Required keys:

* `fuel_type` (diesel, regular, midgrade, premium)

Example URL input: `http://localhost:3000/gasprice/midgrade.json`

Example JSON output:

```json
{
"price": 2.98
}
```
(*`/gasprice/index` shown below*)

```json
{
"data": {
"fuelPrices": {
"cng": "2.11",
"diesel": "2.91",
"e85": "3.21",
"electric": "0.12",
"lpg": "2.92",
"midgrade": "2.98",
"premium": "3.14",
"regular": "2.77"
}
}
}
```
