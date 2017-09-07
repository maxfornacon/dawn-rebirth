class AddUserIdToPets < ActiveRecord::Migration[5.0]
  def change
  	add_column :pets, :user_id, :integer
    add_index :pets, :user_id
  end
end
