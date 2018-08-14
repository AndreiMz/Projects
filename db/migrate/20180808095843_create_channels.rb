# d
class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :channel_url

      t.timestamps
    end
  end
end
