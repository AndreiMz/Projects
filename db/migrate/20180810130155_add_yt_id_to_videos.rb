class AddYtIdToVideos < ActiveRecord::Migration[5.2]
  def change
  	add_column :videos, :youtube_id,:string
  end
end
