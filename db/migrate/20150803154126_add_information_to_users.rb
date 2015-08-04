class AddInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :university, :string
    add_column :users, :write?, :boolean, default: false
    add_column :users, :my_article_id, :integer
  end
end
