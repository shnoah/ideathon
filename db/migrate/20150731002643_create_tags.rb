class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      
      t.string :tagging
      
      t.timestamps null: false
    end
  end
end
