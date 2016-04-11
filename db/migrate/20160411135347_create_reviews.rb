class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews, id: false do |t|
      t.references :user_property_period, null: false, foreign_key: true
      t.text :reviewText
      t.timestamps null: false
    end
    add_index :reviews, :user_property_period_id, unique: true
  end
end
