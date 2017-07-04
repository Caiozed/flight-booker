class FlightsController < ApplicationController
  def index
  	@airports = Airport.all.distinct
  end
end
