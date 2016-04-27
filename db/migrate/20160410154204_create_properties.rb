class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :addressLine1
      t.string :addressLine2
      t.string :town
      t.string :county
      t.string :postcode

      t.timestamps null: false
    end
  end
end
