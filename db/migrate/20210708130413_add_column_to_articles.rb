class AddColumnToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :visibility, :string
  end
end
