class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :owner_id
      t.integer :duration
      t.datetime :start_at
      t.integer :place_id
      t.integer :sport_id
      t.integer :max_number_members
      t.text :note
      t.timestamps
    end
    add_index :events, :owner_id
    add_index :events, :place_id
    add_index :events, :sport_id
  end
end
