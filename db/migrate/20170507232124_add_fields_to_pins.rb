class AddFieldsToPins < ActiveRecord::Migration[5.0]
  def change
  	add_column :pins, :heading, :string
  	add_column :pins, :subheading, :string
  end
end
