class RenameProductAttributeAssociationToProductAttributeValue < ActiveRecord::Migration
  def change
    rename_table :product_attribute_associations, :product_attribute_values
  end
end
