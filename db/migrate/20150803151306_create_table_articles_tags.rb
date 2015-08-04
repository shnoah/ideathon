class CreateTableArticlesTags < ActiveRecord::Migration
  def self.up
      create_table 'articles_tags', :id => false do |t|
        t.column :article_id, :integer
        t.column :tag_id, :integer
        
        t.timestamps
      end
  end

  def self.down
      drop_table :articles_tags
  end
end