class CreateLinetalks < ActiveRecord::Migration
  def change
    create_table :linetalks do |t|
      t.string :linetalk_content

      t.timestamps null: false
    end
  end
end
