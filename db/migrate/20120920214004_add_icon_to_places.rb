class AddIconToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :icon, :string
  end
end
