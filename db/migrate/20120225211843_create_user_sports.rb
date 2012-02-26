class CreateUserSports < ActiveRecord::Migration
  def change
    create_table :user_sports do |t|
      t.integer :user_id
      t.integer :sport_id
      t.timestamps
    end
    add_index :user_sports, :user_id
    add_index :user_sports, :sport_id
  end
end
