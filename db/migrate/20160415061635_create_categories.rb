class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :name, default: :false
      t.references :category, index: true
      t.timestamps null: false
    end
  end
end
