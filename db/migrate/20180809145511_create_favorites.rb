# d
class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :id_user
      t.integer :id_channel

      t.timestamps
    end
  end
end
