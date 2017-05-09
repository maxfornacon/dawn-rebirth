class AddPintypeToPins < ActiveRecord::Migration[5.0]
  def change
  	add_column :pins, :pintype, :string, default: "serious"
  end
end