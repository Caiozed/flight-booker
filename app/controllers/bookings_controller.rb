class BookingsController < ApplicationController
  def new
  	@booking = Booking.new
  	form_objects(params[:flight][:num_tickets].to_i)
  	@flight = Flight.find(params[:flight][:flight_id])
  end

  def create
    messages = []
  	@flight = Flight.find(params[:booking][:flight_id])
  	@book_params = booking_params
  	form_objects(@book_params[:num_tickets].to_i)
  	@booking = @flight.bookings.build(num_passengers: params[:booking][:num_tickets].to_i)
  	
  	if @booking.save
  		params[:passengers].each do |p|
  			passenger = @booking.passengers.build(name: p[:name], email: p[:email])
  			unless passenger.save
  				@booking.reload.destroy
  				render :new and return
        else
          messages << PassangerMailer.thank_you_email(passenger)
  			end
  		end
        messages.each {|msg| msg.deliver_now}
  		  redirect_to booking_path(@booking)
  	else
  		render :new
  	end
  end

  def show
  	@booking = Booking.find(params[:id])
  	@flight = @booking.flight
  	@passengers = @booking.passengers
  end

  def booking_params
  	params.require(:booking).permit(:flight_id, :num_tickets, passengers: [:name, :email])
  end

  def form_objects(num_tickets)
  	@passengers = []
  	@num_tickets = num_tickets
  	num_tickets.times do
  		@passengers << Passenger.new
  	end
  end
end
