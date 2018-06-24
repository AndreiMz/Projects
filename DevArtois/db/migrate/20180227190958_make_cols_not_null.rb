class MakeColsNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column :beer_styles, :style_name, :string, null: false
    change_column :beer_styles, :alcohol, :float, null: false
    change_column :beer_styles, :bitterness, :integer, null: false
    change_column :beer_styles, :color, :integer, null: false
  end
end
