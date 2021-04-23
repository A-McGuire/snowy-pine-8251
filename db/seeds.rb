# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.destroy_all
Airline.destroy_all
PassengerFlight.destroy_all
Passenger.destroy_all

airline1 = Airline.create!(name: "Frontier")
airline2 = Airline.create!(name: "United")
flight1 = airline1.flights.create!(number: 1111, date: "04/01/21", departure_city: "Denver", arrival_city: "New York")
flight2 = airline1.flights.create!(number: 2222, date: "04/02/21", departure_city: "LA", arrival_city: "DC")
flight3 = airline2.flights.create!(number: 3333, date: "04/03/21", departure_city: "Bozeman", arrival_city: "Denver")

passenger1 = flight1.passengers.create!(name: "pass1", age:18)
passenger2 = flight1.passengers.create!(name: "pass2", age:50)
passenger3 = flight1.passengers.create!(name: "pass3", age:5)

passenger4 = flight2.passengers.create!(name: "pass4", age:17)
passenger5 = flight2.passengers.create!(name: "pass5", age:55)
passenger6 = flight2.passengers.create!(name: "pass6", age:16)

passenger7 = flight3.passengers.create!(name: "pass7", age:19)
passenger8 = flight3.passengers.create!(name: "pass8", age:12)
passenger9 = flight3.passengers.create!(name: "pass9", age:58)