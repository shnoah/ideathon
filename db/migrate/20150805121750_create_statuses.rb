class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      
      t.integer :article_id
      t.integer :user_id
      t.boolean :liked, default: false
      t.boolean :selected, default: false

      t.timestamps null: false
    end
  end
end
