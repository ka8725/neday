class AddIconToSports < ActiveRecord::Migration
  def change
    add_column :sports, :icon, :string
  end
end
