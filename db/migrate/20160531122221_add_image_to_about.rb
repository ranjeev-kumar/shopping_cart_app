class AddImageToAbout < ActiveRecord::Migration
  def change
    add_column :abouts, :avatar, :string
  end
end
