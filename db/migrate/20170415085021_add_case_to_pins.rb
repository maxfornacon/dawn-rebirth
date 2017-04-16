class AddCaseToPins < ActiveRecord::Migration[5.0]
  def change
  	add_column :pins, :case, :string, default: "serious"
  end
end
