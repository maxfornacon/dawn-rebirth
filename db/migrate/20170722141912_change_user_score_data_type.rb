class ChangeUserScoreDataType < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :score, :decimal
  end
end
