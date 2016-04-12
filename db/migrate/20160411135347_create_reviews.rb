class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user_property_period, foreign_key: true, index: true
      t.text :reviewText
      t.timestamps null: false
    end
  end
end
