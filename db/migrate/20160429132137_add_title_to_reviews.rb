class AddTitleToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewTitle, :string
  end
end
