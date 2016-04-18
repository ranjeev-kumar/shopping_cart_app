class CreateProductAttributeAssociations < ActiveRecord::Migration
  def change
    create_table :product_attribute_associations do |t|
      t.references :product, index: true
      t.references :product_attribute, index: true
      t.references :attribute_value, index: true
      t.boolean :status, default: :false
      t.timestamps null: false
    end
  end
end
