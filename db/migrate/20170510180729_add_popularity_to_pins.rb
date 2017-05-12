class AddPopularityToPins < ActiveRecord::Migration[5.0]
  def change
  	add_column :pins, :popularity, :bigint, default: 0
  end
end
