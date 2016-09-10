class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
		add_column :users, :name, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :owner, :boolean, :default => false
  	add_column :users, :guildmember, :boolean, :default => false
  	add_column :users, :guild_id, :integer, :default => false
  	add_column :users, :status, :text
  	add_column :users, :favanime, :string
  	add_column :users, :favmanga, :string
  	add_column :users, :bio, :text
  	add_column :users, :twitter, :string
  	add_column :users, :facebook, :string
  	add_column :users, :instagram, :string
  	add_column :users, :askfm, :string
  	add_column :users, :snapchat, :string
  	add_column :users, :googleplus, :string
  	add_column :users, :admin, :boolean, default: false
  	add_column :users, :score, :integer

  	add_column :users, :guildrank, :integer, default: 0
  end
end
