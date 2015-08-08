class CreateBests < ActiveRecord::Migration
  def change
    create_table :bests do |t|
      t.integer   :todaybest_id
      t.timestamps null: false
    end
  end
end
