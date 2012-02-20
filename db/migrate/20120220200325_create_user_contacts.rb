class CreateUserContacts < ActiveRecord::Migration
  def change
    create_table :user_contacts do |t|
      t.integer :contact_type_id
      t.string :value

      t.timestamps
    end
    add_index :user_contacts, :contact_type_id
  end
end
