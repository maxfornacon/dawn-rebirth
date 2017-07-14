class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.string :title
      t.text :body
      t.string :updatetype

      t.timestamps
    end
  	add_column :updates, :user_id, :integer
    add_index :updates, :user_id
  end
end
