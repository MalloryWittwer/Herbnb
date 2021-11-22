class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :pickup_date
      t.date :return_date
      t.float :price
      t.references :mower, null: false, foreign_key: true
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
