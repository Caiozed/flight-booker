# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airport1 = Airport.create!(city_code: "NYC")
airport2 = Airport.create!(city_code: "SFO")
airport3 = Airport.create!(city_code: "MIA")

10.times do
	airport1.departing_flights.create!(finish_id: airport2.id,
								duration: rand(1..2), start_datetime: rand(1..30).day.from_now)	
end

10.times do
	airport2.departing_flights.create!(finish_id: airport1.id,
								duration: rand(1..2), start_datetime: rand(1..30).day.from_now)	
end


10.times do
	airport1.departing_flights.create!(finish_id: airport2.id,
								duration: rand(1..2), start_datetime: rand(1..30).day.ago)	
end

10.times do
	airport2.departing_flights.create!(finish_id: airport1.id,
								duration: rand(1..2), start_datetime: rand(1..30).day.ago)	
end

