class AddInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :university, :string
    add_column :users, :posting_check, :integer, :default => 0
    add_column :users, :my_article_id, :integer
  end
end
