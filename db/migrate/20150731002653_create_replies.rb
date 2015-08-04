class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|

      t.string :writer # 리플을 단 사람    
      
      t.integer :article_id
      t.string :contents

      t.timestamps null: false
    end
  end
end
