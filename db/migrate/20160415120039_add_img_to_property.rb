class AddImgToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :img, :string
  end
end
