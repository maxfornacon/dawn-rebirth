class AddFieldsToGuilds < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :guilds, :image
  	add_column :guilds, :score, :integer
  	add_column :guilds, :guildtype, :string

  	add_column :guilds, :user_id, :integer
    add_index :guilds, :user_id
  end
end
