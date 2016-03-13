class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :order_id
      t.integer :person_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
