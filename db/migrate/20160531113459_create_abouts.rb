class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :para1
      t.text :para2
      t.text :para3
      t.timestamps null: false
    end
  end
end
