class AddParametersToFlat < ActiveRecord::Migration[5.2]
  def change
     add_column :flats, :title, :string
     add_column :flats, :description, :text
     add_column :flats, :location, :string
     add_column :flats, :price, :integer
  end
end
