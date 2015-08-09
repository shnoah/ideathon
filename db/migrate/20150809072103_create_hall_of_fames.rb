class CreateHallOfFames < ActiveRecord::Migration
  def change
    create_table :hall_of_fames do |t|

      t.timestamps null: false
    end
  end
end
