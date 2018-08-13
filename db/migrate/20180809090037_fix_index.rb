class FixIndex < ActiveRecord::Migration[5.2]
  def change
  	remove_index :channels, :video_id
  	remove_column :channels, :video_id
  	
  	add_column :videos, :channel_id, :integer
  	add_index :videos, :channel_id
  end
end
