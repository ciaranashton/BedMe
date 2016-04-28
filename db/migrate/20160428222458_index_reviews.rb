class IndexReviews < ActiveRecord::Migration
  def change
    add_foreign_key :reviews, :user
    add_foreign_key :reviews, :property
    add_index :reviews, :user_id
    add_index :reviews, :property_id
    add_index :reviews, [:user_id, :property_id, :created_at]
  end
end