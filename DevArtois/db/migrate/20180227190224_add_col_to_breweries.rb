class AddColToBreweries < ActiveRecord::Migration[5.1]
  def change
  	add_column :breweries, :brewery_name ,:string
  	add_column :breweries, :brewery_coordinates, :string
  	add_column :breweries, :brewery_website ,:string
  	add_column :breweries, :brewery_full_address, :string
  end
end
