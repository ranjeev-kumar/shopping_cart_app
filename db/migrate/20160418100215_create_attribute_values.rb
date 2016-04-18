class CreateAttributeValues < ActiveRecord::Migration
  def change
    create_table :attribute_values do |t|
      t.string :value
      t.boolean :status, default: :false
      t.references :product_attribute, index: true
      t.timestamps null: false
    end
  end
end
