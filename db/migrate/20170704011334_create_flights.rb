class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer 	:start_id
      t.integer 	:finish_id
      t.datetime 	:start_datetime
      t.integer 	:duration

      t.timestamps
    end
  end
end
