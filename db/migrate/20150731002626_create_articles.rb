class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      
      t.string :title
      t.string :summary
      t.string :password 
      t.text :contents
      t.string :my_image #aws upload용. 변수명 변경 금지!
      t.string :contact_kakao
      t.string :contact_email
      t.string :demo_link
      t.string :leader_name
      t.string :member_name 
      t.string :score, defult: 0

      t.timestamps null: false
    end
  end
end
