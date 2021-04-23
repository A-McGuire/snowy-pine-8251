require 'rails_helper'

RSpec.describe 'airline show page' do
  it 'has a list of passengers that have flights on this airline, no duplicates, no children' do
    airline = Airline.create!(name: "Frontier")
    flight1 = airline.flights.create!(number: 1111, date: "04/01/21", departure_city: "Denver", arrival_city: "New York")
    flight2 = airline.flights.create!(number: 2222, date: "04/02/21", departure_city: "LA", arrival_city: "DC")

    passenger1 = flight1.passengers.create!(name: "pass1", age:18)
    passenger2 = flight1.passengers.create!(name: "pass2", age:50)
    passenger3 = flight1.passengers.create!(name: "pass3", age:5)
    
    passenger2 = flight2.passengers.create!(name: "pass2", age:50)
    passenger4 = flight2.passengers.create!(name: "pass4", age:17)
    passenger5 = flight2.passengers.create!(name: "pass5", age:55)
    passenger6 = flight2.passengers.create!(name: "pass6", age:16)

    visit "/airlines/#{airline.id}"

    expect(page).to have_content(passenger1.name)
    expect(page).to have_content(passenger2.name)
    expect(page).to have_content(passenger5.name)
    expect(page).to_not have_content(passenger3.name)
    expect(page).to_not have_content(passenger4.name)
    expect(page).to_not have_content(passenger6.name)
  end
end