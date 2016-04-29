class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, index: true
      t.references :property, foreign_key: true, index: true
      t.integer :rating_area
      t.integer :rating_cost
      t.integer :rating_cleanliness
      t.integer :rating_landlord
      t.text :reviewText
      t.timestamps null: false
    end
    add_index :reviews, [:user_id, :property_id, :created_at]
  end
end
