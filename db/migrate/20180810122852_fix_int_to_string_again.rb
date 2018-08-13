class FixIntToStringAgain < ActiveRecord::Migration[5.2]
  def change
  	change_column :favorites,:id_channel,:string 
  	change_column :favorites,:id_user,:string 
  end
end
