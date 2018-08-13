class RenameNameToStyleName < ActiveRecord::Migration[5.1]
  def change
    rename_column :beer_styles, :name, :style_name
  end
end
