class CreateUserPropertyPeriods < ActiveRecord::Migration
  def change
    create_table :user_property_periods do |t|
      t.references :user, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
