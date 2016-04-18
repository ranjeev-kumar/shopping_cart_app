class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.string :name
      t.boolean :status, default: :false
      t.timestamps null: false
    end
  end
end
