#TripCompare

(or some other app name that's more clever/catchy)

###What it does

This is/will be a program that can help the savvy traveler make intelligent
financial decisions for long-distance trips in the continental US.  

Airline tickets prohibitively expensive?  Got a fuel-efficient car?  Ever wonder
if it would be cheaper to drive to your destination instead of flying? TripCompare
can give you the definitive answer.

###How it does it

1. User inputs trip origin and destination. TripCompare calls Google's Directions
API to return the total driving distance and duration of trip.
2. User inputs car's MPG. TripCompare consults the API at [FuelEconomy](www.fueleconomy.gov)
for local gas prices, determines how many gallons of gas will be necessary for
the trip, and calculates the expected gas price.
3. TripCompare calls Google's QPX Express API (if we can ever figure out how) to
find the lowest fare for a one-way trip to the user's destination.
