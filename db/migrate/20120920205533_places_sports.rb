class PlacesSports < ActiveRecord::Migration
  def up
    create_table :places_sports, :id => false do |t|
      t.column :place_id, :integer
      t.column :sport_id, :integer
    end
  end

  def down
    drop_table :places_sports
  end
end
