class ChangeCoordsBrewery < ActiveRecord::Migration[5.1]
  def change
  	remove_column :breweries, :brewery_coordinates
  	add_column :breweries, :brewery_latitude, :float
  	add_column :breweries, :brewery_longitude, :float
  end
end
