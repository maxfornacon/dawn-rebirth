class CreateMsgs < ActiveRecord::Migration[5.0]
  def change
    create_table :msgs do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
