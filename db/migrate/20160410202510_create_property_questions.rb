class CreatePropertyQuestions < ActiveRecord::Migration
  def change
    create_table :property_questions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true
      t.string :questionTitle
      t.text   :questionText
      t.datetime :questionTime, null: false

      t.timestamps null: false
    end
  end
end
