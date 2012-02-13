class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :locationable_id
      t.string :locationable_type
      t.string :address
      t.timestamps
    end
    add_index :locations, :locationable_type
    add_index :locations, :locationable_id
  end
end
