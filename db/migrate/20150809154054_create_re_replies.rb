class CreateReReplies < ActiveRecord::Migration
  def change
    create_table :re_replies do |t|
      
      t.string :writer
      t.string :writer_email
      t.string :contents
      t.integer :reply_id

      t.timestamps null: false
    end
  end
end
