class ChangeReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_property_period, :integer
    change_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      t.integer :rating_cleanliness
      t.integer :rating_cost
      t.integer :rating_area
      t.integer :rating_landlord 
    end
  end
end
