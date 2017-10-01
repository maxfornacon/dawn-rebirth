class AddUserIdToRpgChars < ActiveRecord::Migration[5.0]
  def change
  	add_column :rpg_chars, :user_id, :integer
    add_index :rpg_chars, :user_id
  end
end
