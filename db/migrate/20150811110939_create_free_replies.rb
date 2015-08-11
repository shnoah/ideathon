class CreateFreeReplies < ActiveRecord::Migration
  def change
    create_table :free_replies do |t|
      
      
      t.string :writer        # 댓글에 글쓴이 이름을 출력. contents로 한 번에 처리 시 수정할 떄 문제 발생
      t.string :writer_email  # 이름으로만 체크할 경우 동명이인이 생길 수 있음  
      
      
      t.integer :freearticle_id
      t.string :contents

      t.timestamps null: false
    end
  end
end
