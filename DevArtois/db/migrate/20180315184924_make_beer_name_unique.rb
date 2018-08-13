class MakeBeerNameUnique < ActiveRecord::Migration[5.1]
  def change
    change_column :beers, :beer_name, :string, unique: true
  end
end
