class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.timestamps
    end
  end
end
