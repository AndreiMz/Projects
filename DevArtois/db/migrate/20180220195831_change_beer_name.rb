class ChangeBeerName < ActiveRecord::Migration[5.1]
  def change
    rename_column :beers, :name, :beer_name
  end
end
