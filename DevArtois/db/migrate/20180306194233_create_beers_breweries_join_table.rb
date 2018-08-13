class CreateBeersBreweriesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :beers, :breweries do |t|
      t.index :beer_id
      t.index :brewery_id
    end
  end
end
