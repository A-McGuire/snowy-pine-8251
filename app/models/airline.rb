class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights

  def all_passengers
    self.passengers
        .where("passengers.age > ?", 17)
        .select("passengers.*")
        .distinct
        .order("passengers.age") #ordering so the test passes consistently
  end
end
