class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 6, scale: 4
      t.boolean :status, default: :true
      t.timestamps null: false
    end
  end
end
