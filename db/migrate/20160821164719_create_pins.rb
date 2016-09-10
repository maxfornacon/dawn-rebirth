class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.text :description
			
			
      t.timestamps
    end
    add_attachment :pins, :image
  end
end
