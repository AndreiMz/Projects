class ForgotToSavePreviousOne < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :video_id, :string
    add_index(:favorites, :video_id)
  end
end
