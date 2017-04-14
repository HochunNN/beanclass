class AddClassCampusToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :class_campus, :string
  end
end
