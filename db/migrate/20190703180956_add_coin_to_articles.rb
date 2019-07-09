class AddCoinToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :coin, :string
  end
end
