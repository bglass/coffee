class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :person_id
      t.integer :person_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
