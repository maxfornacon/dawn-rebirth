class AddUserIdToAnimes < ActiveRecord::Migration[5.0]
  def change
    add_column :animes, :user_id, :integer
  end
end
