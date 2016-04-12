class CreateReviewComments < ActiveRecord::Migration
  def change
    create_table :review_comments do |t|
      t.references :review, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :commentText
      t.timestamp :commentTimeStamp

      t.timestamps null: false
    end
  end
end
