# d
class AddChannelIndex < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :video_id, :integer
    add_index :channels, :video_id
  end
end
