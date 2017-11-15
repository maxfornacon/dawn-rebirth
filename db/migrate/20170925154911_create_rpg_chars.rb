class CreateRpgChars < ActiveRecord::Migration[5.0]
  def change
    create_table :rpg_chars do |t|
      t.string :name
      t.boolean :team, default: false
      t.integer :xp, default: 0
            
      t.timestamps
    end
  end
end
