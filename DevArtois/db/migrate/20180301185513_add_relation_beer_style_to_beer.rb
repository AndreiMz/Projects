class AddRelationBeerStyleToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :beer_style_id, :integer
    add_index  :beers, :beer_style_id
    add_foreign_key :beers, :beer_styles
  end
end
