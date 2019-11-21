class AddGuestAndBedroomsToFlat < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :guests, :integer
    add_column :flats, :bedrooms, :integer
  end
end
