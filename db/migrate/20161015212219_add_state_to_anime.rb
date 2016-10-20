class AddStateToAnime < ActiveRecord::Migration[5.0]
  def change
    add_column :animes, :state, :string, default: 'to_watch'
  end
end
