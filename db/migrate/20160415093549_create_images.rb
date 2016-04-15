class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :type
      t.string :main, default: :false
      t.integer :image_size
      t.references :product, index: true
      t.timestamps null: false
    end
  end
end
