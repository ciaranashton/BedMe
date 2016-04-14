class CreatePropertyAnswers < ActiveRecord::Migration
  def change
    create_table :property_answers do |t|
      t.references :property_question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :answerText

      t.timestamps null: false
    end
  end
end
