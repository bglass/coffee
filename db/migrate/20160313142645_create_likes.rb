class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :person_id
      t.integer :product_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
