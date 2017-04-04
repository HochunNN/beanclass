class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|

      t.string  :class_day
      t.integer :class_begin
      t.integer :class_end
      t.string  :class_room
      
      
      t.timestamps null: false
    end
  end
end
