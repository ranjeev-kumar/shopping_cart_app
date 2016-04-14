class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.references :created_by, references: :admins
      t.references :modified_by, references: :admins
      t.boolean :status, default: :false
      t.timestamps null: false
    end
  end
end
