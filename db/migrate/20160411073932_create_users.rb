class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.boolean :status, default: :false
      t.timestamps null: false
    end
  end
end
