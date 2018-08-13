class CreateBeerStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_styles do |t|
      t.string :name
      t.text :description
      t.float :alcohol
      t.integer :bitterness
      t.integer :color
      t.timestamps
    end
  end
end
