require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
  end

  describe 'instance methods' do
    describe 'passengers' do
      it 'returns all passengers that have flights on airline, no duplicates, no children' do
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

        expect(airline.passengers).to eq([passenger1, passenger2, passenger5])
      end
    end
  end
end
