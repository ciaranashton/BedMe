class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews, id: false do |t|
      t.references :user_property_period, index: true, null: false, foreign_key: true, unique: true
      t.text :reviewText
      t.timestamps null: false
    end
  end
end
