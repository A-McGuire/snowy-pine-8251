class FlightsController < ApplicationController
  def index
    @flights = Flight.all #TODO view is logic heavy refactor
  end

  def destroy
    flight = Flight.find(params[:id])
    passenger = Passenger.find(params[:passenger])
    flight.passengers.delete(passenger) #TODO: this probably shouldn't live here
    redirect_to '/flights'
  end
end