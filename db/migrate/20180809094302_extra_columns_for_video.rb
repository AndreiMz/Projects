class ExtraColumnsForVideo < ActiveRecord::Migration[5.2]
  def change
  	add_column :videos, :max_quality, :string
  	add_column :videos, :duration, :string
  end
end
