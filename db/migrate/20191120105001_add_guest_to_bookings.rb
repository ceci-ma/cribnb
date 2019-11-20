class AddGuestToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :guest, :string
  end
end
