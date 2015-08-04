class CreateArticleImages < ActiveRecord::Migration
  def change
    create_table :article_images do |t|

      t.timestamps null: false
    end
  end
end
