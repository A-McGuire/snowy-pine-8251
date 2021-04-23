require 'rails_helper'

RSpec.describe 'flights index page' do
  it 'has a list of all flight numbers with respective airlines' do
    airline1 = Airline.create!(name: "Frontier")
    airline2 = Airline.create!(name: "United")
    flight1 = airline1.flights.create!(number: 1111, date: "04/01/21", departure_city: "Denver", arrival_city: "New York")
    flight2 = airline1.flights.create!(number: 2222, date: "04/02/21", departure_city: "LA", arrival_city: "DC")
    flight3 = airline2.flights.create!(number: 3333, date: "04/03/21", departure_city: "Bozeman", arrival_city: "Denver")

    visit '/flights'

    within("#flight-#{flight1.id}") do
      expect(page).to have_content(flight1.number)
      expect(page).to have_content(airline1.name)
    end

    within("#flight-#{flight2.id}") do
      expect(page).to have_content(flight2.number)
      expect(page).to have_content(airline1.name)
    end
    
    within("#flight-#{flight3.id}") do
      expect(page).to have_content(flight3.number)
      expect(page).to have_content(airline2.name)
    end
  end

  it 'has a list of passengers for each flight' do
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

    visit '/flights'

    within("#flight-#{flight1.id}") do
      expect(page).to have_content(passenger1.name)
      expect(page).to have_content(passenger2.name)
      expect(page).to have_content(passenger3.name)
    end
    
    within("#flight-#{flight2.id}") do
      expect(page).to have_content(passenger4.name)
      expect(page).to have_content(passenger5.name)
      expect(page).to have_content(passenger6.name)
    end
    
    within("#flight-#{flight3.id}") do
      expect(page).to have_content(passenger7.name)
      expect(page).to have_content(passenger8.name)
      expect(page).to have_content(passenger9.name)
    end
  end
end