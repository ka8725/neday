class CreateEventMembers < ActiveRecord::Migration
  def change
    create_table :event_members do |t|
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
    add_index :event_members, :user_id
    add_index :event_members, :event_id
  end
end
