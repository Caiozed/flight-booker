class FlightsController < ApplicationController 
  def index
  	@airports = Airport.all.distinct
  	unless params[:search].nil?
  		search = search_params 
  		@flights = Flight.where("start_id = ? AND finish_id = ? AND start_datetime = ?", 
  														search[:from_code], search[:to_code], search[:date])
  	end
  end



  def search_params
 		params.require(:search).permit(:from_code, :to_code, :num_tickets, :date)
  end
end
