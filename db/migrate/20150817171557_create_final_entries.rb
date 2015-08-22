class CreateFinalEntries < ActiveRecord::Migration
  def change
    create_table :final_entries do |t|
      t.integer :user_id
      t.integer :final_id
      t.timestamps null: false
    end
  end
end
