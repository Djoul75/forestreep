class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :forest, null: false, foreign_key: true
      t.float :total_price
      t.boolean :booked

      t.timestamps
    end
  end
end
