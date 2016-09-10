class AddContentHtmlToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :body_html, :text
  end
end
