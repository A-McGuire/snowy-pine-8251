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
      expect(page).to have_content(flight1.id)
      expect(page).to have_content(airline1.id)
    end

    within("#flight-#{flight2.id}") do
      expect(page).to have_content(flight2.id)
      expect(page).to have_content(airline1.id)
    end
    
    within("#flight-#{flight3.id}") do
      expect(page).to have_content(flight3.id)
      expect(page).to have_content(airline2.id)
    end
  end

  it 'has a list of passengers for each flight'
end