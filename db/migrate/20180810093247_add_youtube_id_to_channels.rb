# d
class AddYoutubeIdToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :youtube_id, :string
  end
end
