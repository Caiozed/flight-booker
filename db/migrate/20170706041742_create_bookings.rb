class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :num_passengers

      t.timestamps
    end
  end
end
