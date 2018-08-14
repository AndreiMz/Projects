# d
class ChangeIntToStringInVideo < ActiveRecord::Migration[5.2]
  def change
    change_column :videos, :channel_id, :string
  end
end
