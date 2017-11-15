class AddFieldsToRpgChars < ActiveRecord::Migration[5.0]
  def change
  	add_column :rpg_chars, :level, :integer
  	add_column :rpg_chars, :needed_xp, :integer
  end
end
