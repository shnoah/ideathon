class CreateFreearticles < ActiveRecord::Migration
  def change
    create_table :freearticles do |t|
      t.string :free_title
      t.string :free_writer
      t.text  :free_article
      t.string :free_password

      t.timestamps null: false
    end
  end
end
