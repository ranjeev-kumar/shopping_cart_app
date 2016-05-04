class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.decimal :dicount_of, precision: 12, scale: 2
      t.references :created_by, references: :admins
      t.references :modified_by, references: :admins
      t.boolean :status, default: :false
      t.integer :no_of_uses
      t.timestamps null: false
    end
  end
end
