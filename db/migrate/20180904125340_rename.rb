class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :id_user, :user_id
    rename_column :favorites, :id_channel, :channel_id
  end
end
