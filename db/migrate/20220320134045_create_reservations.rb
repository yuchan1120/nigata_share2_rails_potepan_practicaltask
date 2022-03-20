class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_day
      t.date :end_day
      t.integer :people
      t.integer :total_price
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
