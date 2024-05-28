class AddTotalPriceToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :total_price, :float
  end
end
