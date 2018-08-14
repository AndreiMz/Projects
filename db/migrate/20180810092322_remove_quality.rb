# d
class RemoveQuality < ActiveRecord::Migration[5.2]
  def change
    remove_column :videos, :max_quality
    add_column :videos, :is_hd, :boolean
  end
end
