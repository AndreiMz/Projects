class AddIndexToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index(:favorites, :user_id)
    add_index(:favorites, :channel_id)
  end
end
